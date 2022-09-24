//
//  NetworkServiceProtocol.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 24.09.2022.
//

import Alamofire
protocol INetworkService {
    func fetch<T>(path: String, paramaters: [String: String]?, data: Codable?, method: HTTPMethod, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void)

    func generateData(data: Codable?) -> [String: Any]?
}
