//
//  TopView.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/9/21.
//

import UIKit

protocol TopViewDelegate: class {
    func onFilterList(type: FilterType)
}

class TopView: UIView {
    
    var shadowLayer:CAShapeLayer!
    weak var delegate: TopViewDelegate?
    
    let textInput: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = Colors.bgTV
        tf.layer.borderColor = Colors.appGray.cgColor
        tf.layer.borderWidth = 2
        tf.layer.cornerRadius = 16
        tf.textColor = .gray
        tf.placeholder = "Search"
        tf.font = .systemFont(ofSize: 14)
        tf.setLeftPaddingPoints(18)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let labelFBy: UILabel = {
        let label = UILabel()
        label.text = "Filter by"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.bgTV
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let btnFilter1: FilterButton = {
        let btn = FilterButton()
        btn.button.tag = 0
        btn.layer.cornerRadius = 16
        btn.text.text = "All"
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let btnFilter2: FilterButton = {
        let btn = FilterButton()
        btn.button.tag = 1
        btn.layer.cornerRadius = 16
        btn.text.text = "Active"
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let btnFilter3: FilterButton = {
        let btn = FilterButton()
        btn.button.tag = 2
        btn.layer.cornerRadius = 16
        btn.text.text = "Down"
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let btnFilter4: FilterButton = {
        let btn = FilterButton()
        btn.button.tag = 3
        btn.hasImage = true
        btn.layer.cornerRadius = 16
        btn.text.text = "      All Locations"
        //btn.text.textAlignment = .right
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let rightView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "top_right")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()

            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 0).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            
            shadowLayer.shadowColor = UIColor.gray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 3.0, height: 1.0)
            shadowLayer.shadowOpacity = 0.7
            shadowLayer.shadowRadius = 3
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
    
    
    func setupViews() {
        
        self.addSubview(textInput)
        textInput.heightAnchor.constraint(equalToConstant: 32).isActive = true
        textInput.widthAnchor.constraint(equalToConstant: 225).isActive = true
        textInput.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        textInput.leftAnchor.constraint(lessThanOrEqualTo: self.leftAnchor, constant: 20).isActive = true
        
        self.addSubview(separator)
        self.addConstraintsWithFormat(format: "V:|-1-[v0]-1-|", views: separator)
        separator.widthAnchor.constraint(equalToConstant: 2).isActive = true
        NSLayoutConstraint(item: separator, attribute: .left, relatedBy: .equal, toItem: textInput, attribute: .right, multiplier: 1, constant: 10).isActive = true
        
        
        self.addSubview(labelFBy)
        labelFBy.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        NSLayoutConstraint(item: labelFBy, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 0.65, constant: 0).isActive = true
        
        self.addSubview(btnFilter1)
        btnFilter1.selected = true
        btnFilter1.heightAnchor.constraint(equalToConstant: 32).isActive = true
        btnFilter1.widthAnchor.constraint(equalToConstant: 46).isActive = true
        btnFilter1.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        NSLayoutConstraint(item: btnFilter1, attribute: .left, relatedBy: .equal, toItem: labelFBy, attribute: .right, multiplier: 1, constant: 12).isActive = true
        btnFilter1.button.addTarget(self, action: #selector(onFilterTapped), for: .touchUpInside)
        
        self.addSubview(btnFilter2)
        btnFilter2.selected = false
        btnFilter2.heightAnchor.constraint(equalToConstant: 32).isActive = true
        btnFilter2.widthAnchor.constraint(equalToConstant: 68).isActive = true
        btnFilter2.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        NSLayoutConstraint(item: btnFilter2, attribute: .left, relatedBy: .equal, toItem: btnFilter1, attribute: .right, multiplier: 1, constant: 10).isActive = true
        btnFilter2.button.addTarget(self, action: #selector(onFilterTapped), for: .touchUpInside)
        
        self.addSubview(btnFilter3)
        btnFilter3.selected = false
        btnFilter3.heightAnchor.constraint(equalToConstant: 32).isActive = true
        btnFilter3.widthAnchor.constraint(equalToConstant: 68).isActive = true
        btnFilter3.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        NSLayoutConstraint(item: btnFilter3, attribute: .left, relatedBy: .equal, toItem: btnFilter2, attribute: .right, multiplier: 1, constant: 10).isActive = true
        btnFilter3.button.addTarget(self, action: #selector(onFilterTapped), for: .touchUpInside)
        
        
        self.addSubview(btnFilter4)
        btnFilter4.selected = false
        btnFilter4.heightAnchor.constraint(equalToConstant: 32).isActive = true
        btnFilter4.widthAnchor.constraint(equalToConstant: 120).isActive = true
        btnFilter4.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        NSLayoutConstraint(item: btnFilter4, attribute: .left, relatedBy: .equal, toItem: btnFilter3, attribute: .right, multiplier: 1, constant: 10).isActive = true
        btnFilter4.button.addTarget(self, action: #selector(onFilterTapped), for: .touchUpInside)
        
        self.addSubview(rightView)
        NSLayoutConstraint(item: rightView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: rightView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0).isActive = true
        
    }
    
    @objc func onFilterTapped(sender: UIButton) {
        btnFilter1.selected = false
        btnFilter2.selected = false
        btnFilter3.selected = false
        btnFilter4.selected = false
        
        switch(sender.tag) {
        case 0:
            btnFilter1.selected = true
            delegate?.onFilterList(type: .All)
        case 1:
            btnFilter2.selected = true
            delegate?.onFilterList(type: .Active)
        case 2:
            btnFilter3.selected = true
            delegate?.onFilterList(type: .Down)
        case 3:
            btnFilter4.selected = true
            delegate?.onFilterList(type: .Location)
        default:
            return
        }
    }
    
    


}
