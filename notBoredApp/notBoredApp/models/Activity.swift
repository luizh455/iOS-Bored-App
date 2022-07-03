//
//  Activity.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 23/06/22.
//

import Foundation

struct Activity : Codable {
    let activity : String
    let type : String
    let participants : Int
    let price : Float
    let link : String
    let key : String
    let accessibility : Float
    let fixedNumberOfParticipants : Bool?

    var priceString : String {
        switch price {
        case let price where price == 0.00:
            return "Free"
        case let price where price <= 0.30:
            return "Low"
        case let price where price <= 0.60:
            return "Medium"
        default:
            return "High"

        }
    }
}
