//
//  APIError.swift
//  KiliaroApp
//
//  Created by Farhad on 2/24/22.
//

import Foundation

enum APIError: LocalizedError {
    case unknown(err: Error)
    case notValidURL
    case notValidModel
    
    var message: String {
        switch self {
        case .notValidModel:
            return "I can parse your model"
            
        case .notValidURL:
            return "Your base url is not valid"
            
        case .unknown(let err)
            return err.localizedDescription
        }
    }
}
