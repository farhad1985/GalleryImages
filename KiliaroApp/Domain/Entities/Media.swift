//
//  Media.swift
//  KiliaroApp
//
//  Created by Farhad on 2/24/22.
//

struct Media: Codable {
    let id: String
    let userID: String
    let mediaType: String
    let filename: String
    let size: Int
    let createdAt: String
    let md5Sum: String
    let contentType: String
    let video: String?
    let thumbnailURL, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case mediaType = "media_type"
        case filename, size
        case createdAt = "created_at"
        case md5Sum = "md5sum"
        case contentType = "content_type"
        case video
        case thumbnailURL = "thumbnail_url"
        case downloadURL = "download_url"
    }
    
    init(mediaDB: MediaDB) {
        self.id = mediaDB.id
        self.userID = mediaDB.userID
        self.mediaType = mediaDB.mediaType
        self.filename = mediaDB.filename
        self.size = mediaDB.size
        self.createdAt = mediaDB.createdAt
        self.md5Sum = mediaDB.md5Sum
        self.contentType = mediaDB.contentType
        self.video = mediaDB.video
        self.thumbnailURL = mediaDB.thumbnailURL
        self.downloadURL = mediaDB.downloadURL
    }
}
