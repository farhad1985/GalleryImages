//
//  MediaDB.swift
//  KiliaroApp
//
//  Created by Farhad on 2/26/22.
//

import RealmSwift
import Foundation

class MediaDB: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var userID: String = ""
    @objc dynamic var mediaType: String = ""
    @objc dynamic var filename: String = ""
    @objc dynamic var size: Int = 0
    @objc dynamic var createdAt: String = ""
    @objc dynamic var md5Sum: String = ""
    @objc dynamic var contentType: String = ""
    @objc dynamic var video: String = ""
    @objc dynamic var thumbnailURL = ""
    @objc dynamic var downloadURL: String = ""
    
    init(media: Media) {
        id = media.id
        userID = media.userID
        mediaType = media.mediaType
        filename = media.filename
        size = media.size
        createdAt = media.createdAt
        md5Sum = media.md5Sum
        contentType = media.contentType
        video = media.video ?? ""
        thumbnailURL = media.thumbnailURL
        downloadURL = media.downloadURL
    }
    
    required init() {}
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
