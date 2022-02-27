//
//  URLSessionService.swift
//  KiliaroApp
//
//  Created by Farhad on 2/27/22.
//

import Foundation

protocol URLSessionServiceable {}

extension URLSessionServiceable {
    
    func execute<T: Codable>(request: URLRequest,
                             completion: @escaping (Result<T,APIError>) -> ()) {
        
        URLSession
            .shared
            .dataTask(with: request) { data, response, error in
                
                if let err = error {
                    completion(Result.failure(.unknown(err: err)))
                    return
                }
                
                guard
                    let d = data,
                    let model = try? JSONDecoder().decode(T.self, from: d)
                else {
                    completion(Result.failure(.notValidModel))
                    return
                }
                
                completion(Result.success(model))
            }
            .resume()
    }
}
