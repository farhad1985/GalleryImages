//
//  File.swift
//  KiliaroApp
//
//  Created by Farhad on 2/27/22.
//

import Foundation

protocol TimeStampServiceable {
    
    func saveTimeStamp(date: Date)

    func isValidTimeStamp() -> Bool
}
