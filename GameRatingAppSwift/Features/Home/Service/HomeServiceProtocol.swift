//
//  HomeServiceProtocol.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 24.09.2022.
//

protocol HomeServiceProtocol {
    func fetchListOfGames(onSuccess: @escaping (Games?)-> Void, onError: @escaping (BaseError) -> Void)
    
    func fetchDetailsOfGame()
}
