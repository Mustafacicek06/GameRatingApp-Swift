//
//  HomeTableViewProtocol.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 29.09.2022.
//


protocol HomeTableViewProtocol {
    func removeItem(item: GameModel,index: Int)
    func didSelect(item: GameModel,index: Int)
}
