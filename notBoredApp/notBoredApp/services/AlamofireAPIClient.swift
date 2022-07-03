//
//  AlamofireAPIClient.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 23/06/22.
//


import Foundation
import Alamofire

final class AlamofireAPIClient {
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response {
            response in
            completion(response.result)
        }
    }
}

