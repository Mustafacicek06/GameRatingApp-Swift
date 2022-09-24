//
//  NetworkService+StringPath.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 24.09.2022.
//

import Foundation


extension NetworkService {
    
    //MARK: It's FirebaseRest Path must be required .json
    func networkPath(path: String) -> String {
        return "\(baseConfig.baseUrl)\(path)"
    }
}
