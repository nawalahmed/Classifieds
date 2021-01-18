//
//  AppUtilities.swift
//  Classifieds
//
//  Created by Nawal Ahmed on 16/01/2021.
//  Copyright © 2021 Nawal Ahmed. All rights reserved.
//

import Foundation
import UIKit

class AppUtilities {

    func showProgressIndicator(view: UIView) {

        view.isUserInteractionEnabled = false

        let progressIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        progressIndicator.tag = AppConstants.progressIndicatorViewTag
        progressIndicator.startAnimating()
        progressIndicator.center = view.center

        view.addSubview(progressIndicator)
    }

    func hideProgressIndicator(view: UIView) {
        view.isUserInteractionEnabled = true

        if let viewWithTag = view.viewWithTag(AppConstants.progressIndicatorViewTag) {
            viewWithTag.removeFromSuperview()
        }
    }
}
