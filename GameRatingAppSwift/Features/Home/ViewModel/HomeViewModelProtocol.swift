//
//  HomeViewModelProtocol.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 28.09.2022.
//

import Foundation


protocol HomeViewModelProtocol {
    associatedtype T
    var isLoading: Bool {get}
    var gameItems: [GameModel] {get}
    var homeService: HomeServiceProtocol {get}
    func fetchGameItems()
    
    
}
