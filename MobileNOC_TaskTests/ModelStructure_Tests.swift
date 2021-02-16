//
//  ModelStructure_Tests.swift
//  MobileNOC_TaskTests
//
//  Created by Jasur Rajabov on 2/9/21.
//

import XCTest
@testable import MobileNOC_Task

class ModelStructure_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_ServerStatus() {
        let testServer = ServerData(id: 1, name: "Test", ipAddress: "", ipSubnetMask: nil, status: StatusData(id: 1, statusValue: "", legacyValue: ""))
        
        XCTAssertNotNil(testServer)
        XCTAssertEqual(testServer.status.id, Server.ServerStatus.ready.rawValue)
    }
    
    func test_ServerRepresentable() {
        let testRepresentable = ServerRepresentable(id: 0, server: Server(image: "", country: "USA", name: "NOC01", ipAddress: "192.168.1.1", ipSubnetMask: "255.255.255.0", check: false, phone: false, delay: false, muted: false, message: "", status: .none))
        
        XCTAssertNotNil(testRepresentable)
        XCTAssertEqual(testRepresentable.server.country, "USA")
        XCTAssertEqual(testRepresentable.server.name, "NOC01")
        XCTAssertFalse(testRepresentable.server.check)
        XCTAssertNotEqual(testRepresentable.server.status, .ready)
    }
    
    

}
