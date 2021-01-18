//
//  ListingRouter.swift
//  Classifieds
//
//  Created by Nawal Ahmed on 1/16/21.
//  Copyright © 2021 Nawal Ahmed. All rights reserved.
//

import Foundation
import UIKit

class ListingRouter: PresenterToRouterProtocol {

    func pushToDetailScreen(navigationController: UINavigationController, item: ListingModel) {

        if let detailModule = DetailRouter.createDetailModule(item: item) {
            navigationController.pushViewController(detailModule, animated: true)
        }
    }

    static func createModule() -> ListingViewController? {

        let storyboard = UIStoryboard(name: "main", bundle: nil)
        guard let view = storyboard.instantiateViewController(identifier: "ListingViewController") as? ListingViewController else {
            return nil
        }

        let presenter = ListingPresenter()
        let router: PresenterToRouterProtocol = ListingRouter()
        let interactor: PresenterToInteractorProtocol = ListingInteractor()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
}
