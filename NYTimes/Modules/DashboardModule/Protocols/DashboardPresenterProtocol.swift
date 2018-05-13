//
//  DashboardPresenterProtocol.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation

@objc protocol DashboardPresenterProtocol : BasePresenterProtocol {
    func presentMostViewedResults(_ results: [Article])
}
