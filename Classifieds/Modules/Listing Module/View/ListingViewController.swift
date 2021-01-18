//
//  ListingViewController.swift
//  Classifieds
//
//  Created by Nawal Ahmed on 1/16/21.
//  Copyright © 2021 Nawal Ahmed. All rights reserved.
//

import UIKit
import ImageCachingFramework

class ListingViewController: UIViewController {

    let appUtilities = AppUtilities()
    var presenter: ViewToPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    var listingArray: [ListingModel]?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Listing"
        presenter?.startFetchingListing()
        appUtilities.showProgressIndicator(view: self.view)

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ListingViewController: PresenterToViewProtocol {

    func showListing(listingArray: [ListingModel]) {
        self.listingArray = listingArray
        self.tableView.reloadData()
        appUtilities.hideProgressIndicator(view: self.view)
    }

    func showError() {

        appUtilities.hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching List", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ListingViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listingArray?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListingCell else {
            return UITableViewCell() // default cell
        }

        cell.title.text = listingArray?[indexPath.row].name
        cell.price.text = listingArray?[indexPath.row].price

        let imageUrlString = listingArray?[indexPath.row].thumbnailURLs?.first

        if  let imagePathString = imageUrlString {
            cell.imageThumbnail.imageFromServerURL(urlString: imagePathString,
                                                   tableView: tableView,
                                                   indexpath: indexPath)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showDetailListingController(navigationController: navigationController!,
                                               item: (listingArray?[indexPath.row])!)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AppConstants.defaultListingRowHeight
    }
}

class ListingCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var imageThumbnail: UIImageView!
}
