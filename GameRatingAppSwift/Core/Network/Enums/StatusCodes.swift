//
//  StatusCodes.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 24.09.2022.
//

import Alamofire


enum StatusCodes: Int  {
    case notFound = 404
    case success = 200
    
    static func afErrorNotFound(afError: AFError?) -> Int {
            return afError?.responseCode ?? notFound.rawValue
        }
}

extension StatusCodes {
    
    static func isSuccess(val: Int) -> Bool {
        return val == StatusCodes.success.rawValue
    }
}
