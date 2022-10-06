//
//  HomeDataSource.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 29.09.2022.
//

import UIKit

struct Cells {
    static let gameCell = "gameCell"
}

final class HomeTableViewProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var gameItems: [GameModel]
    var delegate: HomeTableViewProtocol?
    
    init(gameItems: [GameModel]) {
        self.gameItems = gameItems
         
        super.init()
    }
    
    func updateItems(gameItems: [GameModel])  {
        self.gameItems = gameItems
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return gameItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.gameCell) as! GameCell
        cell.setGame(game: gameItems[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(item: gameItems[indexPath.row
                                           ], index: indexPath.row)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    

    
}
