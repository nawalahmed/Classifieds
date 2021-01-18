//
//  DetailListingProtocols.swift
//  Classifieds
//
//  Created by Nawal Ahmed on 1/16/21.
//  Copyright © 2021 Nawal Ahmed. All rights reserved.
//

import Foundation

protocol ViewToPresenterDetailProtocol: class {

    var view: PresenterToViewDetailProtocol? {get set}
    var interactor: PresenterToInteractorDetailProtocol? {get set}
    var router: PresenterToRouterDetailProtocol? {get set}
    var data: ListingModel? {get set}
}

protocol PresenterToViewDetailProtocol: class {

    func showData(data: ListingModel)
}

protocol PresenterToRouterDetailProtocol: class {

    static func createDetailModule(item: ListingModel) -> DetailListingViewController?
}

protocol PresenterToInteractorDetailProtocol: class {

    var presenter: InteractorToPresenterDetailProtocol? {get set}

}

protocol InteractorToPresenterDetailProtocol: class {

}
