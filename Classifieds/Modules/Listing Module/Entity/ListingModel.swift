//
//  ListingModel.swift
//  Classifieds
//
//  Created by Nawal Ahmed on 1/16/21.
//  Copyright © 2021 Nawal Ahmed. All rights reserved.
//

import Foundation
import ObjectMapper

struct ListingModelConstants {
    static let identifier = "uid"
    static let name = "name"
    static let price = "price"
    static let imageIds = "image_ids"
    static let imageURLs = "image_urls"
    static let thumbnailURLs = "image_urls_thumbnails"
}

class ListingModel: Mappable {

    internal var identifier: String?
    internal var name: String?
    internal var price: String?
    internal var imageIds: [String]?
    internal var imageURLs: [String]?
    internal var thumbnailURLs: [String]?

    required init?(map: Map) {
        mapping(map: map)
    }

    func mapping(map: Map) {
        identifier <- map[ListingModelConstants.identifier]
        name <- map[ListingModelConstants.name]
        price <- map[ListingModelConstants.price]
        imageIds <- map[ListingModelConstants.imageIds]
        imageURLs <- map[ListingModelConstants.imageURLs]
        thumbnailURLs <- map[ListingModelConstants.thumbnailURLs]
    }
}
