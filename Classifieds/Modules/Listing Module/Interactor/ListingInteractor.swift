//
//  ListingInteractor.swift
//  Classifieds
//
//  Created by Nawal Ahmed on 1/16/21.
//  Copyright © 2021 Nawal Ahmed. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ListingInteractor: PresenterToInteractorProtocol {

    var presenter: InteractorToPresenterProtocol?

    func fetchListing() {

        let request = AF.request(AppConstants.requestURL)

        request.responseJSON { (response) in
            if response.response?.statusCode == 200 {
                if let json = response.value as AnyObject?,
                   let arrayResponse = json["results"] as? [[String: Any]] {
                    let arrayObject = Mapper<ListingModel>().mapArray(JSONArray: arrayResponse)
                    self.presenter?.listingFetchedSuccess(listingModelArray: arrayObject)
                }
            } else {
                self.presenter?.listingFetchFailed()
            }
        }
    }
}
