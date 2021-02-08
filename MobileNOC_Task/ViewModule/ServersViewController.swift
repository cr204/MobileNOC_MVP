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
        tv.backgroundColor = Colors.bgTV
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
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ServerListCell.self, forCellReuseIdentifier: "ServerListCell")
        
        setupViews()
        presenter?.onViewDidLoad(view: self)
    }
    
    private func setupViews() {
        
        view.addSubview(tableView)
        view.addConstraintsWithFormat(format: "H:|-60-[v0]|", views: tableView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: tableView)
    }

}

extension ServersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServerListCell", for: indexPath) as! ServerListCell
        cell.configure(withServer: servers[indexPath.row].server)
        return cell
    }
    
    
}

extension ServersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
}

