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
}
