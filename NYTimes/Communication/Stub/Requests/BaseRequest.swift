//
//  BaseRequest.swift
//  NYTimes
//
//  Created by Zelux on 2018. 05. 02..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseRequest: NSObject, Mappable {

    override init() {
        super.init()
    }

    required init?(map: Map) {
    }

    func mapping(map: Map) {

    }
}
