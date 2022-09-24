//
//  BaseResponse.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 24.09.2022.
//


struct BaseResponse<T: Codable> {
    var model: T?
    var message: String?
}
