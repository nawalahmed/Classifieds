//
//  ListingPresenter.swift
//  Classifieds
//
//  Created by Nawal Ahmed on 1/16/21.
//  Copyright © 2021 Nawal Ahmed. All rights reserved.
//

import Foundation
import UIKit

class ListingPresenter: ViewToPresenterProtocol {

    var interactor: PresenterToInteractorProtocol?

    var router: PresenterToRouterProtocol?

    var view: PresenterToViewProtocol?

    func showDetailListingController(navigationController: UINavigationController, item: ListingModel) {
        router?.pushToDetailScreen(navigationController: navigationController, item: item)
    }

    func startFetchingListing() {
        interactor?.fetchListing()
    }
}

extension ListingPresenter: InteractorToPresenterProtocol {
    func listingFetchedSuccess(listingModelArray: [ListingModel]) {
        view?.showListing(listingArray: listingModelArray)
    }

    func listingFetchFailed() {
        view?.showError()
    }
}
