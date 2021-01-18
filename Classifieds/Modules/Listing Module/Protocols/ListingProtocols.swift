//
//  ListingProtocols.swift
//  Classifieds
//
//  Created by Nawal Ahmed on 1/16/21.
//  Copyright © 2021 Nawal Ahmed. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class {

    var interactor: PresenterToInteractorProtocol? { get set}
    var router: PresenterToRouterProtocol? {get set}
    var view: PresenterToViewProtocol? {get set}

    func startFetchingListing()
    func showDetailListingController(navigationController: UINavigationController, item: ListingModel)
}

protocol InteractorToPresenterProtocol: class {
    func listingFetchedSuccess(listingModelArray: [ListingModel])
    func listingFetchFailed()
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchListing()
}

protocol PresenterToRouterProtocol: class {

    static func createModule() -> ListingViewController?
    func pushToDetailScreen(navigationController: UINavigationController, item: ListingModel)
}

protocol PresenterToViewProtocol: class {
    func showError()
    func showListing(listingArray: [ListingModel])
}
