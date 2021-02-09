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
    private var headerTitle = "All Servers"
        
    var lastCell: ServerListCell?
    var lastCellIndex: IndexPath = IndexPath(item: 0, section: 10)
    
    let leftView: LeftView = {
        let view = LeftView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topView: TopView = {
        let view = TopView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = Colors.bgTV
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
    
    override var prefersStatusBarHidden: Bool {
         return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        
        topView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ServerListCell.self, forCellReuseIdentifier: "ServerListCell")
        
        setupViews()
        presenter?.onViewDidLoad(view: self)
    }
    
    private func setupViews() {
        
        view.addSubview(tableView)
        view.addConstraintsWithFormat(format: "H:|-60-[v0]|", views: tableView)
        view.addConstraintsWithFormat(format: "V:|-50-[v0]|", views: tableView)
        
        view.addSubview(topView)
        view.addConstraintsWithFormat(format: "H:|-60-[v0]|", views: topView)
        topView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        view.addSubview(leftView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: leftView)
        leftView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        NSLayoutConstraint(item: leftView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0).isActive = true
        
    }

}

extension ServersViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = SectionHeaderView()
        vw.title.text = headerTitle
        return vw
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServerListCell", for: indexPath) as! ServerListCell
        cell.whiteBackground.backgroundColor = indexPath == lastCellIndex ? Colors.bgSelectedCell : .white
        cell.configure(withServer: servers[indexPath.row].server)
        return cell
    }
    
    
}

extension ServersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        lastCell?.whiteBackground.backgroundColor = .white
        
        let cell = tableView.cellForRow(at: indexPath) as! ServerListCell
        cell.whiteBackground.backgroundColor = Colors.bgSelectedCell
        lastCellIndex = indexPath
        lastCell = cell
    }
    
}

extension ServersViewController: TopViewDelegate {
    func onFilterList(text: String) {
        presenter?.filter(byText: text)
    }
    
    func onFilterList(type: FilterType) {
        headerTitle = type.rawValue
        presenter?.filter(byType: type)
    }
    
    
}
