//
//  ServersVCPresenter.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/7/21.
//

import Foundation

enum FilterType {
    case All, Active, Down, Location
}

protocol ServersVCPresenterType {
    mutating func onViewDidLoad(view: ServerViewControllerDelegate)
    mutating func filter(byType filter: FilterType)
    mutating func filter(byText filter: String)
}

struct ServersVCPresenter: ServersVCPresenterType {
        
    private let dataService: DataServiceType
    private weak var view: ServerViewControllerDelegate?
    private var serverData:[ServerRepresentable] = []
    
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
        serverData = representables
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
                country: Bool.random() ? "Brasil" : "Argentina",
                name: item.name,
                ipAddress: item.ipAddress,
                ipSubnetMask: item.ipSubnetMask ?? "missing",
                check: Bool.random(),
                phone: Bool.random(),
                delay: Bool.random(),
                muted: Bool.random(),
                message: Bool.random() ? "CPU 100%" : "",
                status: Server.ServerStatus.init(rawValue: item.status.id) ?? .none)
            
            servers.append(ServerRepresentable(id: item.id, server: newServer))
        }
        
        return servers
    }
    
    public mutating func filter(byType filter: FilterType) {
        switch filter {
        case .All:
            view?.servers = serverData
        case .Active:
            let filtered = serverData.filter { $0.server.status == .ready }
            view?.servers = filtered
        case .Down:
            let filtered = serverData.filter { $0.server.status == .overload }
            view?.servers = filtered
        case .Location:
            let sorted = serverData.sorted { $0.server.country < $1.server.country }
            view?.servers = sorted
        }
    }
    
    public mutating func filter(byText filter: String) {
        if filter == "" {
            view?.servers = serverData
            return
        }
            
        let sorted = serverData.filter { containsWord(text: $0.server.country, searchWords: [filter]) }
        view?.servers = sorted
    }
    
    private func containsWord(text: String, searchWords: [String]) -> Bool {
        return searchWords
            .reduce(false) { $0 || text.contains($1) }
    }

    
}
