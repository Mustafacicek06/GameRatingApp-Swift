//
//  GameModel.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 24.09.2022.
//

import Foundation


struct Result: Decodable {
    let result: [GameModel]?
}


struct GameModel: Decodable {
    let id: Int?
    let name, released: String?
    let backgroundImage: String?
    let rating: Double?

    enum CodingKeys: String, CodingKey {
        case backgroundImage = "background_image"
        case id
        case name
        case released
        case rating
    }


}
