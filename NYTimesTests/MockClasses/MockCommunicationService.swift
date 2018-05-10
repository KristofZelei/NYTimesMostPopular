//
//  MockCommunicationService.swift
//  NYTimesTests
//
//  Created by Zelux on 2018. 05. 01..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation
import UIKit
@testable import NYTimes

class MockCommunicationService : CommunicationServiceProtocol {      
    func fetchMostViewed(offset: Int , completion: @escaping (FetchMostViewedResult?) -> Void) {
        completion(result)
    }
    
    var result: FetchMostViewedResult!
}
