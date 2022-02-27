//
//  SharedMediaService.swift
//  KiliaroApp
//
//  Created by Farhad on 2/24/22.
//

import Foundation

struct SharedMediaService: SharedMediaServiceable, URLSessionServiceable {
    
    private var session = URLSession.shared
    
    func fetchMediaList(id: String,
                        completion: @escaping (Result<[Media], APIError>) -> ()) {
        
        guard
            let url = URL(string: APIRoute.sharedMedia(id: id).url)
        else {
            completion(Result.failure(.notValidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        execute(request: request, completion: completion)
    }
}
