//
//  NetworkManagerProtocol.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 24.09.2022.
//

protocol  NetworkManagerProtocol {
    
    var service: INetworkService {get}
}

extension NetworkManagerProtocol {
    var service: INetworkService {
        return NetworkService(config: ApplicationConstants.BASE_CONFIG)
    }
}
