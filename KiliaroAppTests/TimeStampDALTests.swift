//
//  TimeStampDALTest.swift
//  KiliaroAppTests
//
//  Created by Farhad on 2/27/22.
//

import XCTest
@testable import KiliaroApp

class TimeStampDALTests: XCTestCase {
    
    private let timeStampDAL: TimeStampServiceable = TimeStampDAL()
    
    
    func testAtFirstTimeWithoutTime() {
        // action
        let isValid = timeStampDAL.isValidTimeStamp()
        
        // assertion
        XCTAssertFalse(isValid)
    }
    
    // this test is normal date. your dateTime should be valid.
    func testSaveTimeStamp() {
        // arrange
        let current = Date()
        
        // action
        timeStampDAL.saveTimeStamp(date: current)
        let isValid = timeStampDAL.isValidTimeStamp()
        
        // assertion
        XCTAssertTrue(isValid)
    }
    
    
    // Your expireInterval is less than current interval
    func testSaveExpireTimeStamp() {
        // arrange
        let expireInterval = Date(timeIntervalSince1970: 1)
        
        // action
        timeStampDAL.saveTimeStamp(date: expireInterval)
        let isValid = timeStampDAL.isValidTimeStamp()
        
        // assertion
        XCTAssertFalse(isValid)
    }
}
