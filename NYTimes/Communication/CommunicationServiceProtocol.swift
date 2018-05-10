//
//  CommunicationServiceProtocol.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation
import UIKit

@objc protocol CommunicationServiceProtocol {
    func fetchMostViewed(offset: Int , completion: @escaping (FetchMostViewedResult?) -> Void)
}
