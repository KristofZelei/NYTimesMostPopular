//
//  Pizza.swift
//  NennosPizza
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import UIKit
import ObjectMapper

class MetaData : NSObject, Mappable {
    var url: String?
    var format: String?
    var height: Int?
    var width: Int?

    init(url: String?, format: String?, height: Int?, width: Int?) {
        self.url = url
        self.format = format
        self.height = height
        self.width = width
    }

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        url <- map["url"]
        format <- map["format"]
        height <- map["height"]
        width <- map["width"]
    }
}

