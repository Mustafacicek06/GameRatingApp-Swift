//
//  HomeService.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 24.09.2022.
//

import Alamofire


final class HomeService: NetworkManagerProtocol, HomeServiceProtocol {
    
    
    func fetchListOfGames(onSuccess: @escaping (Games?) -> Void, onError: @escaping (BaseError) -> Void) {
        service.fetch(path: NetworkPath.GAMES.rawValue, paramaters: ["key=": "37526aab294342e1930cd7189d879d33"], data: nil, method: HTTPMethod.get) { (response: BaseResponse<Games>) in
            onSuccess(response.model)
        } onError: { (error) in
            onError(error)
        }

    }

    func fetchDetailsOfGame() {
        print("a")
    }


}
