//
//  DetailListingRouter.swift
//  Classifieds
//
//  Created by Nawal Ahmed on 1/16/21.
//  Copyright © 2021 Nawal Ahmed. All rights reserved.
//

import Foundation
import UIKit

class DetailRouter: PresenterToRouterDetailProtocol {

    static func createDetailModule(item: ListingModel) -> DetailListingViewController? {

        let storyboard = UIStoryboard(name: "main", bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: "DetailListingViewController") as? DetailListingViewController else {
            return nil
        }

        let presenter = DetailListingPresenter()
        let interactor: PresenterToInteractorDetailProtocol = DetailListingInteractor()
        let router: PresenterToRouterDetailProtocol = DetailRouter()

        view.detailPresenter = presenter

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.data = item
        interactor.presenter = presenter

        return view
    }
}
