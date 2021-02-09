//
//  SectionHeaderView.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/9/21.
//

import UIKit

class SectionHeaderView: UIView {
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "All Servers"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = Colors.bgTV
        label.textColor = Colors.textDarkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initViews() {
        self.backgroundColor = Colors.bgTV
        
        self.addSubview(separator)
        self.addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: separator)
        separator.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
        NSLayoutConstraint(item: separator, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        self.addSubview(title)
        title.widthAnchor.constraint(equalToConstant: 150).isActive = true
        NSLayoutConstraint(item: title, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: title, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        

        
    }
    
    
}
