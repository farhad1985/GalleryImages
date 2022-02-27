//
//  APIServiceable.swift
//  KiliaroApp
//
//  Created by Farhad on 2/24/22.
//

protocol SharedMediaServiceable {
    
    func fetchMediaList(id: String,
                        completion: @escaping (Result<[Media], APIError>) -> ())
}

