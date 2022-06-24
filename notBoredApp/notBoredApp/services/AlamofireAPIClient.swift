//
//  AlamofireAPIClient.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 23/06/22.
//


import Foundation
import Alamofire

class AlamofireAPIClient {
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response {
            response in
            completion(response.result)
        }
//        request.responseJSON { data in
//            completion(data)
//        }
//        let request = AF.request(url, method: .get, parameters: .none, encoding: JSONEncoding.default, headers: .default, interceptor: .none, requestModifier: .none)
        
//            request.responseJSON { data in
//                completion(data, data.result.success)
//            }

//        AF.request(url).response { response in
//            completion(response.result)
//        }
    }
}

