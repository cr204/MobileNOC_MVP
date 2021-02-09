//
//  ServersVCPresenter.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/7/21.
//

import Foundation

protocol ServersVCPresenterType {
    mutating func onViewDidLoad(view: ServerViewControllerDelegate)
}

struct ServersVCPresenter: ServersVCPresenterType {
    
    private let dataService: DataServiceType
    private weak var view: ServerViewControllerDelegate?
    
    init(dataService: DataServiceType) {
        self.dataService = dataService
    }
    
    mutating func onViewDidLoad(view: ServerViewControllerDelegate) {
        self.view = view
        fetchServerData()
    }
    
    private mutating func fetchServerData() {
        
        // From local JSON
        guard let serverModels = getLocalModels() else { return }
        
        // From server
//        guard let serverModels = getServerModels() else { return }
        
        
        let representables = createRepresentables(from: serverModels)
        view?.servers = representables
    }
    
//    private func getServerModels() -> [ServerData]? {
//        return dataService.getJSONData(link: Links.server)
//    }
    

    private func getLocalModels() -> [ServerData]? {
        guard let filePath = Bundle.main.path(forResource: "servers", ofType: "json")
            else { return nil }
        
        return dataService.getJSONData(filePath: filePath)
    }
    
    
    private func createRepresentables(from serverModels: [ServerData]) -> [ServerRepresentable] {
        var servers = [ServerRepresentable]()
        
        // sorting
        let sortedById = serverModels.sorted { $0.id < $1.id }
        
        sortedById.forEach { item in
            let newServer = Server(
                image: "img_server",
                country: "Brasil",
                name: item.name,
                ipAddress: item.ipAddress,
                ipSubnetMask: item.ipSubnetMask ?? "missing",
                check: Bool.random(),
                phone: Bool.random(),
                delay: Bool.random(),
                muted: Bool.random(),
                message: "CPU 100%",
                status: Server.ServerStatus.init(rawValue: item.status.id) ?? .none)
            
            servers.append(ServerRepresentable(id: item.id, server: newServer))
            servers.append(ServerRepresentable(id: item.id, server: newServer))
        }
        
        return servers
    }
    
    
}
