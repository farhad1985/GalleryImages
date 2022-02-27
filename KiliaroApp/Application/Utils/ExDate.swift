//
//  ExDate.swift
//  KiliaroApp
//
//  Created by Farhad on 2/26/22.
//

import Foundation

extension Date {
    
    var medium: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        
        return formatter.string(from: self)
    }
}
