//
//  DetailListingPresenter.swift
//  Classifieds
//
//  Created by Nawal Ahmed on 1/16/21.
//  Copyright © 2021 Nawal Ahmed. All rights reserved.
//

import Foundation

class DetailListingPresenter: ViewToPresenterDetailProtocol {

    var data: ListingModel?

    var view: PresenterToViewDetailProtocol?

    var interactor: PresenterToInteractorDetailProtocol?

    var router: PresenterToRouterDetailProtocol?

}

extension DetailListingPresenter: InteractorToPresenterDetailProtocol {
    func fetchData(data: ListingModel) {
        view?.showData(data: data)
    }
}
