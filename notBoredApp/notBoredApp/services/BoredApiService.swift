//
//  BoredApiService.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 23/06/22.
//

import Foundation
import Alamofire

//protocol BoredApiServiceProtocol {
//    var apiClient : AlamofireAPIClient { get }
//    func getRandomActivity(completion : @escaping (Activity?) -> Void)
//    //func getActivity(by numberOfParticipants: Int, completion : @escaping (Activity?) -> Void)
//}

final class BoredApiService  {
    
    let apiClient = AlamofireAPIClient()

    func getRandomActivity(completion : @escaping (Activity?) -> Void){
            let activityURL = "http://www.boredapi.com/api/activity/"
            apiClient.get(url: activityURL) { response in
                switch response {
                case .success(let data):
                    do {
                        if let data = data {
                            print("passou")
                            let activity = try
                            JSONDecoder().decode(Activity.self, from: data)
                            print("passou")
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
