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
        
    }
    
    
    
}
