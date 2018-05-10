//
//  ProductTableViewCellConfiguration.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 30..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation

@objc class MostViewedCellConfiguration: NSObject {
    var title: String!
    var writer: String!
    var date: String!
    var imageUrl: String?
    var articleUrl: String?

    override init() {
        super.init()
    }
}
