//
//  GrckiKinoTests.swift
//  GrckiKinoTests
//
//  Created by Lazar Djordjevic on 30.7.24..
//

import XCTest

final class GrckiKinoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // Example of a functional test case.
        let value = 2 + 2
        XCTAssertEqual(value, 4)
    }
    
    func testExample2() throws {
        // Example of a functional test case.
        let value = 3 + 2
        XCTAssertEqual(value, 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
