//
//  SharedMediaService.swift
//  KiliaroApp
//
//  Created by Farhad on 2/24/22.
//

import Foundation

struct SharedMediaService: SharedMediaServiceable {
    
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
        
        session.dataTask(with: request) { data, response, error in
            
            if let err = error {
                completion(Result.failure(.unknown(err: err)))
                return
            }
            
            guard
                let d = data,
                let model = try? JSONDecoder().decode([Media].self, from: d)
            else {
                completion(Result.failure(.notValidModel))
                return
            }
            
            completion(Result.success(model))
        }
        .resume()
    }
}
