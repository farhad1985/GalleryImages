//
//  MediaRepository.swift
//  KiliaroApp
//
//  Created by Farhad on 2/24/22.
//

import Foundation

struct MediaRepository {
    private let mediaService: SharedMediaServiceable
    private let mediaDAL: SharedMediaDatabaseable
    private let timeStampDAL: TimeStampServiceable
    
    init(mediaService: SharedMediaServiceable,
         mediaDAL: SharedMediaDatabaseable,
         timeStampDAL: TimeStampServiceable) {
        
        self.mediaService = mediaService
        self.mediaDAL = mediaDAL
        self.timeStampDAL = timeStampDAL
    }
    
    func fetchMediaList(id: String,
                        completion: @escaping (Result<[Media], APIError>) -> ()) {
        
        guard !timeStampDAL.isValidTimeStamp() else {
            let mediaList = mediaDAL.getAll()
            completion(Result.success(mediaList))
            return
        }
        
        mediaService.fetchMediaList(id: id) { result in
            switch result {
            case .success(let value):
                self.mediaDAL.save(media: value)
                self.timeStampDAL.saveTimeStamp(date: Date())
                completion(Result.success(value))
                
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
}
