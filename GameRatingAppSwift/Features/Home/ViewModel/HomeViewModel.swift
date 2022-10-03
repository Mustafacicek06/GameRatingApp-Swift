//
//  HomeViewController.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 8.09.2022.
//

import UIKit

final class HomeViewModel<T: Codable>: HomeViewModelProtocol , HomeTableViewProtocol{
    var isLoading: Bool = false
    

    
    internal var gameItems: Games = Games(results: [])
    
    var homeService: HomeServiceProtocol
    weak var delegate: HomeViewControllerProtocol?
    
    
    
    
    
    init(homeService: HomeServiceProtocol, delegate: HomeViewControllerProtocol) {
        self.homeService = homeService
        self.delegate = delegate
    }
    
    func fetchGameItems() {
        self.delegate?.changeLoading(value: true)
        homeService.fetchListOfGames { [weak self] games in
            guard let self = self, let delegate = self.delegate else {return}
            delegate.changeLoading(value: false)
            
            
            guard let games = games else {
                delegate.showError(description: "Not Found")
                return
            }
            
            self.gameItems = games
           
            delegate.updateTableView(items: games)
            
            
            
        } onError: { error in
            guard let delegate = self.delegate else {return}
            
            delegate.showError(description: "Not found")
            delegate.changeLoading(value: false)
        }

        
    }
    
    
    func didSelect(item: GameModel, index: Int) {
        delegate?.navigateToDetail(item: item, selectedIndex: index)
    }
    
    

   

}
