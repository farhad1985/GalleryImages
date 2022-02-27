//
//  Publisher.swift
//  KiliaroApp
//
//  Created by Farhad on 2/24/22.
//

import Foundation

final class Publisher<T> {
    typealias Listenr = (T?) -> ()
    
    private var listenr: Listenr?
    
    func onNext(value: T) {
        DispatchQueue.main.async { [weak self] in
            self?.listenr?(value)
        }
    }
    
    func onSubscribe(event: @escaping Listenr) {
        self.listenr = event
    }
}
