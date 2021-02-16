//
//  DataService_Tests.swift
//  MobileNOC_TaskTests
//
//  Created by Jasur Rajabov on 2/9/21.
//

import XCTest
@testable import MobileNOC_Task

class DataService_Tests: XCTestCase {
    var validJSONPath: String?
    var jsonService: DataService?
    let invalidPath = "invalidFilePath"
    
    override func setUp() {
        guard let matchesPath = Bundle.main.path(forResource:"mock_test", ofType: "json") else { return }
        
        validJSONPath = matchesPath
        
        jsonService = DataService()
    }

    func testCorrectJSONPath() {
        guard let validJSONPath = validJSONPath else { return }
        let result = jsonService?.getJSONData(filePath: validJSONPath)
        XCTAssert(result?.count == 3)
    }
    
    
    func testInvalidJSONPath() {
        let result = jsonService?.getJSONData(filePath: invalidPath)
        XCTAssertNil(result)
    }
    
    var arr = [Int]()
    
    func setArray() {
        for i in 0...100000 {
            arr.append(i)
        }
    }
    
    func testMapPerformance() {
        setArray()
        var arr2 = [Int]()
        
        self.measure {
            let _ = arr.map({ i -> Void in
                let sum = 50 * i
                arr2.append(sum)
            })
        }
    }
    
    func testForEachPerformance() {
        setArray()
        var arr2 = [Int]()
        
        self.measure {
            arr.forEach({ i in
                let sum = 50 * i
                arr2.append(sum)
            })
        }
    }

}
