//
//  FindTheMatchTests.swift
//  FindTheMatchTests
//
//  Created by Mohsin Mahmood on 12/19/16.
//  Copyright © 2016 assesment. All rights reserved.
//

import XCTest
@testable import FindTheMatch

class FindTheMatchTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testlistLoad()
    {
        let jsonArray = HelperClass.parselocalJson()
        guard jsonArray.count > 0 else
        {
            assert(false)
        }
    }
    
    func testRandomGet()
    {
        let jsonArray = HelperClass.parselocalJson()
        let randomSelectedWords = HelperClass.getRandomNumbers(from: jsonArray, count: 4)
        guard randomSelectedWords.count > 0 else
        {
            assert(false)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
