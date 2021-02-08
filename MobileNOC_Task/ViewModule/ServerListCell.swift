//
//  ServerListCell.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/7/21.
//

import UIKit

class ServerListCell: UITableViewCell {
    
    let imgServer: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "img_server")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let labelCoutry: UILabel = {
        let label = UILabel()
        label.text = "Country"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.text = "serverName"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Colors.textCyan
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelIPA: UILabel = {
        let label = UILabel()
        label.text = "10.76.0.1"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelIPSM: UILabel = {
        let label = UILabel()
        label.text = "256.256.256.0"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = Colors.textCyan
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imgCheck: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "checked0")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let imgPhone: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "phone0")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let imgDelay: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "delay0")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let imgMuted: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "muted0")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {
        self.backgroundColor = .clear
        
        
        self.contentView.addSubview(imgServer)
        NSLayoutConstraint(item: imgServer, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1, constant: 14).isActive = true
        NSLayoutConstraint(item: imgServer, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        self.contentView.addSubview(labelCoutry)
        NSLayoutConstraint(item: labelCoutry, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1, constant: 75).isActive = true
        NSLayoutConstraint(item: labelCoutry, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        self.contentView.addSubview(labelName)
        NSLayoutConstraint(item: labelName, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 0.55, constant: 0).isActive = true
        NSLayoutConstraint(item: labelName, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        self.contentView.addSubview(labelIPA)
        NSLayoutConstraint(item: labelIPA, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 0.85, constant: 0).isActive = true
        NSLayoutConstraint(item: labelIPA, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 0.8, constant: -3).isActive = true
        
        self.contentView.addSubview(labelIPSM)
        NSLayoutConstraint(item: labelIPSM, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 0.85, constant: 0).isActive = true
        NSLayoutConstraint(item: labelIPSM, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.4, constant: -3).isActive = true
        
        self.contentView.addSubview(imgCheck)
        NSLayoutConstraint(item: imgCheck, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1.2, constant: 0).isActive = true
        NSLayoutConstraint(item: imgCheck, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        self.contentView.addSubview(imgPhone)
        NSLayoutConstraint(item: imgPhone, attribute: .left, relatedBy: .equal, toItem: imgCheck, attribute: .right, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: imgPhone, attribute: .centerY, relatedBy: .equal, toItem: imgCheck, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        self.contentView.addSubview(imgDelay)
        NSLayoutConstraint(item: imgDelay, attribute: .left, relatedBy: .equal, toItem: imgPhone, attribute: .right, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: imgDelay, attribute: .centerY, relatedBy: .equal, toItem: imgCheck, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        self.contentView.addSubview(imgMuted)
        NSLayoutConstraint(item: imgMuted, attribute: .left, relatedBy: .equal, toItem: imgDelay, attribute: .right, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: imgMuted, attribute: .centerY, relatedBy: .equal, toItem: imgCheck, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }
    
    
    func configure(withServer server: Server) {
        
        imgServer.image = UIImage(named: server.image)
        labelCoutry.text = server.country
        labelName.text = server.name
        labelIPA.text = server.ipAddress
        labelIPSM.text = server.ipSubnetMask
        imgCheck.image = UIImage(named: "checked\(server.check ? "1" : "0")")
        imgPhone.image = UIImage(named: "phone\(server.phone ? "1" : "0")")
        imgDelay.image = UIImage(named: "delay\(server.delay ? "1" : "0")")
        imgMuted.image = UIImage(named: "muted\(server.muted ? "1" : "0")")
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
