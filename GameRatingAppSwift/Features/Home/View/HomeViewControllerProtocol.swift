//
//  HomeViewControllerProtocol.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 29.09.2022.
//

protocol HomeViewControllerProtocol: AnyObject {
    func changeLoading(value: Bool)
    func updateTableView(items: [GameModel])
    func navigateToDetail(item: GameModel, selectedIndex: Int)
    func showError(description: String)
}
