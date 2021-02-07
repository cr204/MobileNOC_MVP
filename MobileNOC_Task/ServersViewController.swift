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
        }
    }
    
    init(presenter: ServersVCPresenterType) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .orange
        
        setupViews()
        presenter?.onViewDidLoad(view: self)
        
    }
    
    private func setupViews() {
        
    }


}

