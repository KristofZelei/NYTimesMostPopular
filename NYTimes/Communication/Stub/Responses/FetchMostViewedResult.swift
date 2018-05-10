//
//  FetchAllPizzaResponse.swift
//  NennosPizza
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation
import ObjectMapper

class FetchMostViewedResult : BaseResponse {
    var status: String?
    var copyright: String?
    var numberOfResults: Int?
    var results: [Result]?


    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        status <- map["status"]
        copyright <- map["copyright"]
        numberOfResults <- map["num_results"]
        results <- map["results"]
    }
}
