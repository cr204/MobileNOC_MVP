//
//  ViewController.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/4/21.
//

import UIKit

protocol ServerViewControllerDelegate: class {
    var servers: [ServerRepresentable] { get set }
}


class ServersViewController: UIViewController, ServerViewControllerDelegate {
    
    private var presenter: ServersVCPresenterType?
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var servers: [ServerRepresentable] = [] {
        didSet {
            tableView.reloadData()
            
            print(servers.count)
        }
    }
    
    init(presenter: ServersVCPresenterType) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override var prefersStatusBarHidden: Bool {
         return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        
        setupViews()
        presenter?.onViewDidLoad(view: self)
    }
    
    private func setupViews() {
        
        view.addSubview(tableView)
        view.addConstraintsWithFormat(format: "H:|-50-[v0]|", views: tableView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: tableView)
    }


}

