//
//  Drink.swift
//  NennosPizza
//
//  Created by Zelux on 2018. 04. 29..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation
import ObjectMapper

class Result: NSObject {
    var url: String?
    var adxKeywords: String?
    var column: Int?
    var section: String?
    var byline: String?
    var type: String?
    var title: String?
    var abstract: String?
    var publishedDate: Date?
    var source: String?
    var id: Int64?
    var assetId: Int64?
    var views: Int?
    var desFacet: [String]?
    var orgFacet: [String]?
    var perFacet: [String]?
    var geoFacet: [String]?
    var media: [Media]?
    

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        url <- map["url"]
        adxKeywords <- map["adx_keywords"]
        column <- map["column"]
        section <- map["section"]
        byline <- map["byline"]
        type <- map["type"]
        title <- map["title"]
        abstract <- map["abstract"]
        publishedDate <- map["publishedDate"]
        source <- map["source"]
        id <- map["id"]
        assetId <- map["assetId"]
        views <- map["views"]
        desFacet <- map["des_facet"]
        orgFacet <- map["org_facet"]
        perFacet <- map["per_facet"]
        geoFacet <- map["geo_facet"]
        media <- map["media"]
    }
}
