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
    let ipSubnetMask: String?
    let status: StatusData
}


struct StatusData: Decodable {
    let id: Int
    let statusValue: String
    let legacyValue: String
}

struct Server {
    let image: String
    let country: String
    let name: String
    let ipAddress: String
    let ipSubnetMask: String
    let check: Bool
    let phone: Bool
    let delay: Bool
    let muted: Bool
    let message: String
    let status: ServerStatus
    
    enum ServerStatus: Int, CodingKey {
        case none = 0
        case ready = 1
        case iddle = 2
        case reboot = 3
        case overload = 4
    }

}

struct ServerRepresentable {
    let id: Int
    let server: Server
}
