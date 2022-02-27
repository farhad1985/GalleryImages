//
//  SharedMediaDAL.swift
//  KiliaroApp
//
//  Created by Farhad on 2/26/22.
//

import RealmSwift

class SharedMediaDAL: SharedMediaDatabaseable {
    
    func save(media: [Media]) {
        let realm = try? Realm()
        
        try? realm?.write({
            let mediadb = media.map{ MediaDB(media: $0) }
            realm?.add(mediadb, update: .modified)
        })
    }
    
    func getAll() -> [Media] {
        let realm = try? Realm()
        
        return realm?
            .objects(MediaDB.self)
            .map{Media(mediaDB: $0)} ?? []
    }
}
