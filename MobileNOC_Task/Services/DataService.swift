//
//  DataService.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/6/21.
//

import Foundation

protocol DataServiceType {
    func getJSONData(filePath: String) -> [ServerData]?
}

struct DataService: DataServiceType {
    
    func getJSONData(filePath: String) -> [ServerData]? {
        guard let contentData = FileManager.default.contents(atPath: filePath) else { return nil }
        let jsonString = String(data:contentData, encoding:String.Encoding.utf8)
        let jsonData = jsonString?.data(using: .utf8)
        
        return decodeToModel(JSONData: jsonData)
    }
    
    private func decodeToModel(JSONData: Data?) -> [ServerData]? {
        guard let JSONData = JSONData else { return nil }
        do {
            let parsed = try JSONDecoder().decode(ServersResultData.self, from: JSONData)
            return parsed.content
        } catch {
            print(error)
            return nil
        }
    }
    
}
