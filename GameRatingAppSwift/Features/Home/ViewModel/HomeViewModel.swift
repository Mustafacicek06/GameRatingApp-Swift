//
//  HomeViewController.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 8.09.2022.
//

import UIKit

final class HomeViewModel<T: Codable>: HomeViewModelProtocol {
    var isLoading: Bool
    
    var gameItems: [T]
    
    var homeService: HomeServiceProtocol
    weak var delegate: 
    
    
    
    init(homeService: HomeServiceProtocol) {
        self.homeService = homeService
        
        
    }
    
    func fetchGameItems() {
       
    }
    

   

}
