//
//  ExDate.swift
//  KiliaroApp
//
//  Created by Farhad on 2/26/22.
//

import Foundation

extension String {
    
    func toDate(format: String) -> Date {
        let formater = DateFormatter()
        formater.dateFormat = format
        
        return formater.date(from: self) ?? Date()
    }
}

