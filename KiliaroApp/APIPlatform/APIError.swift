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
}
