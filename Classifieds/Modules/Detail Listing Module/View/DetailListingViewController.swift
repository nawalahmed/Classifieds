//
//  DetailListingViewController.swift
//  Classifieds
//
//  Created by Nawal Ahmed on 1/16/21.
//  Copyright © 2021 Nawal Ahmed. All rights reserved.
//

import UIKit
import ImageCaching

class DetailListingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let appUtilities = AppUtilities()
    var detailPresenter: ViewToPresenterDetailProtocol?

    @IBOutlet weak var tableView: UITableView!
    var data: ListingModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Detail"

        self.data = detailPresenter?.data
        tableView.delegate = self
        tableView.dataSource = self

    }

}

extension DetailListingViewController: PresenterToViewDetailProtocol {

    func showData(data: ListingModel) {
        self.data = data
        self.tableView.reloadData()
    }
}

extension DetailListingViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailCell else {
            return UITableViewCell() // return default cell
        }

        cell.title.text = data?.name
        cell.price.text = data?.price

        let imageUrlString = data?.imageURLs?.first

        if  let imagePathString = imageUrlString {
            cell.myImageView.imageFromServerURL(urlString: imagePathString, tableView: tableView, indexpath: indexPath)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AppConstants.defaultListingDetailRowHeight
    }
}

class DetailCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!

}
