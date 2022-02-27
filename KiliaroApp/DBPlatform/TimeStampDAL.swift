//
//  TimeStampDAL.swift
//  KiliaroApp
//
//  Created by Farhad on 2/27/22.
//

import Foundation

class TimeStampDAL: TimeStampServiceable {
    
    private var key = "expireDate"
    private var userDefault =  UserDefaults.standard
    
    // one minute for caching. It can get it from the server but now it's local
    private var validTime: Double = 1
    
    func saveTimeStamp(date: Date) {
        let interval = date.timeIntervalSince1970
        let expireDate = interval + validTime * 60
        userDefault.set(expireDate, forKey: key)
    }
    
    // If this time is not valid, you can fetch data from the server. this time is based on the minute
    
    func isValidTimeStamp() -> Bool {
        let interval = getTimeStamp()
        let currentTime = Date().timeIntervalSince1970
        
        return interval > currentTime
    }
    
    private func getTimeStamp() -> Double {
        return userDefault.object(forKey: key) as? Double ?? 0
    }
}
