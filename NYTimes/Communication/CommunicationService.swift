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
import ObjectMapper

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
                //completion(Mapper<FetchMostViewedResult>().map(JSONObject:response.result.value))
            }
        }
    }
//
//    func fetchIngredients(completion: @escaping ([IngredientDTO]) -> Void) {
//        guard let url = URL(string: baseURL + "ozt3z") else {
//            completion([IngredientDTO]())
//            return
//        }
//        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
//            guard response.result.isSuccess else {
//                completion([IngredientDTO]())
//                return
//            }
//            if response.data != nil {
//                completion(Mapper<IngredientDTO>().mapArray(JSONObject:response.result.value)!)
//            }
//        }
//    }
//
//    func fetchDetails(completion: @escaping ([DetailDTO]) -> Void) {
//        guard let url = URL(string: baseURL + "150da7") else {
//            completion([DetailDTO]())
//            return
//        }
//        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
//            guard response.result.isSuccess else {
//                completion([DetailDTO]())
//                return
//            }
//            if response.data != nil {
//                completion(Mapper<DetailDTO>().mapArray(JSONObject:response.result.value)!)
//            }
//        }
//    }
//
//    func checkout(request: CheckoutRequest, completion: @escaping () -> Void) {
//        if let jsonString = Mapper().toJSONString(request) {
//            Alamofire.request("http://httpbin.org/post", method: .post, parameters: [:], encoding: jsonString, headers: [:])
//
//        }
//        completion()
//    }
}
