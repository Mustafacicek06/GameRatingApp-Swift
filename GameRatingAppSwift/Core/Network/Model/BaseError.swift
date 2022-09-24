//
//  BaseError.swift
//  GameRatingAppSwift
//
//  Created by Mustafa Çiçek on 24.09.2022.
//

import Alamofire

struct BaseError {
    var errorMessage: String
    var statusCode: Int
    var debugMessage: String
    
    init(_ afError: AFError?) {
        debugMessage = afError.debugDescription
              statusCode = StatusCodes.afErrorNotFound(afError: afError)
              errorMessage = afError?.errorDescription ?? ""
    }
    
}
