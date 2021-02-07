//
//  ServerModel.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/6/21.
//

import Foundation

struct ServersResultData: Decodable {
    let content: [ServerData]
}


struct ServerData: Decodable {
    let id: Int
    let name: String
    let ipAddress: String
    let ipSubnetMask: String
    let status: StatusData
}


struct StatusData: Decodable {
    let id: Int
    let statusValue: String
    let legacyValue: String
}


struct ServerRepresentable {
    let id: Int
    let name: String
    let ipAddress: String
    let ipSubnetMask: String
}
