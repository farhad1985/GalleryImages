//
//  APRoute.swift
//  KiliaroApp
//
//  Created by Farhad on 2/24/22.
//

enum APIRoute {
    case sharedMedia(id: String)
    
    var url: String {
        switch self {
        case .sharedMedia(let id):
            return baseUrl + "/shared/\(id)/media"
        }
    }
    
    private var baseUrl: String {
        return "https://api1.kiliaro.com"
    }
}
