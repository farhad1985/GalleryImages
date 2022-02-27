//
//  DBServiceable.swift
//  KiliaroApp
//
//  Created by Farhad on 2/26/22.
//

import Foundation

protocol SharedMediaDatabaseable {
    
    func save(media: [Media])

    func getAll() -> [Media]

}
