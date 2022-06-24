//
//  BoredApiService.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 23/06/22.
//

import Foundation
import Alamofire

protocol BoredApiServiceProtocol {
    var apiClient : AlamofireAPIClient { get }
    var baseURL : String { get }
    func getRandomActivity(_ numberOfParticipants : Int?, completion : @escaping (Activity?) -> Void)
    func getActivity(by: String, _ :Int?, completion : @escaping (Activity?) -> Void)
}

final class BoredApiService : BoredApiServiceProtocol {
    
    let apiClient = AlamofireAPIClient()
    let baseURL = "http://www.boredapi.com/api"

    func getRandomActivity(_ numberOfParticipants : Int?,  completion : @escaping (Activity?) -> Void){
        var customParticipantsURL = ""
        if let numberOfParticipants = numberOfParticipants {
            customParticipantsURL = "?participants=\(numberOfParticipants)"
        }
            let activityURL = "\(baseURL)/activity\(customParticipantsURL)"
            apiClient.get(url: activityURL) { response in
                switch response {
                case .success(let data):
                    do {
                        if let data = data {
                            let activity = try
                            JSONDecoder().decode(Activity.self, from: data)
                            completion(activity)
                        }
                    } catch {
                        print("catch \(error)")
                    }
                case .failure(_):
                    print("failure")
                    
                }
            }
    }
    
    func getActivity(by type: String, _ numberOfParticipants : Int?, completion : @escaping (Activity?) -> Void){
        var customParticipantsURL = ""
        if let numberOfParticipants = numberOfParticipants {
            customParticipantsURL = "&participants=\(numberOfParticipants)"
        }
        let activityURL = "\(baseURL)/activity?type=\(type)\(customParticipantsURL)"
            apiClient.get(url: activityURL) { response in
                switch response {
                case .success(let data):
                    do {
                        if let data = data {
                            let activity = try
                            JSONDecoder().decode(Activity.self, from: data)
                            completion(activity)
                        }
                    } catch {
                        print("catch \(error)")
                    }
                case .failure(_):
                    print("failure")
                    
                }
            }
    }
    
    
}
