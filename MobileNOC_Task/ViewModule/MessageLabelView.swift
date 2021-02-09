//
//  MessageLabelView.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/8/21.
//

import UIKit

class MessageLabelView: UIView {
    
    let bgView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = Colors.bgRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let labelText: UILabel = {
        let label = UILabel()
        label.text = "CPU 100%"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var message: String = "" {
        didSet {
            initView()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initView() {
        
        self.addSubview(bgView)
        bgView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.addConstraintsWithFormat(format: "V:|[v0]|", views: bgView)
        bgView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.addSubview(labelText)
        labelText.text = message
        NSLayoutConstraint(item: labelText, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: labelText, attribute: .right, relatedBy: .equal, toItem: bgView, attribute: .right, multiplier: 1, constant: -15).isActive = true
        
        
    }
}
