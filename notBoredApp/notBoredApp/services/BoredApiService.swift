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
    func getRandomActivity(_ numberOfParticipants : Int?, completion : @escaping (Activity?) -> Void, onError : @escaping () -> Void)
    func getActivity(by: String, _ :Int?, completion : @escaping (Activity?) -> Void, onError : @escaping () -> Void)
}

final class BoredApiService : BoredApiServiceProtocol {

    internal let apiClient = AlamofireAPIClient()
    internal let baseURL = "http://www.boredapi.com/api"

    func getRandomActivity(_ numberOfParticipants : Int?,  completion : @escaping (Activity?) -> Void, onError : @escaping () -> Void){
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
                        onError()
                        print("catch \(error)")
                    }
                case .failure(_):
                    onError()
                    print("failure")

                }
            }
    }

    func getActivity(by type: String, _ numberOfParticipants : Int?, completion : @escaping (Activity?) -> Void, onError : @escaping () -> Void){
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
                        onError()
                    }
                case .failure(_):
                    print("failure")
                    onError()

                }
            }
    }


}
