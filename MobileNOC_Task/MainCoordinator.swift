//
//  MainCoordinator.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/6/21.
//

import UIKit

struct MainCoordinator {
  
    private let dataService: DataServiceType = DataService()
  
  func start(window: UIWindow?) {
    
    let presenter = ServersVCPresenter(dataService: dataService)
    let vc = ServersViewController(presenter: presenter)
    
    let navigationController = UINavigationController()
    navigationController.setViewControllers([vc], animated: true)
    navigationController.setNavigationBarHidden(true, animated: false)
    
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
  
}
