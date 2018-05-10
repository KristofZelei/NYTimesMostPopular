//
//  CommunicationService.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class CommunicationService : CommunicationServiceProtocol {

    var baseURL = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json"

    func fetchMostViewed(offset: Int , completion: @escaping (FetchMostViewedResult?) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(nil)
            return
        }
        
        let parameters: Parameters = [
            "offset": String(offset)
        ]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: ["api-key" : "0e1ab88269734ea1bf0a2a54e17e9990"]).responseJSON { response in
            guard response.result.isSuccess else {
                completion(nil)
                return
            }
            if response.data != nil {
                let jsonDecoder = JSONDecoder()
                let responseModel = try! jsonDecoder.decode(FetchMostViewedResult.self, from: response.data!)
                completion(responseModel)
            }
        }
    }
}
