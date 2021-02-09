//
//  FilterButton.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/9/21.
//

import UIKit

class FilterButton: UIView {
    
    var hasImage: Bool = false
    
    var selected: Bool = false {
        didSet {
            self.updateView()
        }
    }
    
    let text: UILabel = {
        let label = UILabel()
        label.text = "All"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 11, weight: .bold)
        label.textColor = Colors.appGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let image: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "icon_loc")
        imgView.translatesAutoresizingMaskIntoConstraints = false
       return imgView
    }()
    
    let button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(red: 0, green: 0, blue: 1.0, alpha: 0.0)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.hasImage = false
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = .white //Colors.appBlue
        
        self.addSubview(text)
        self.addConstraintsWithFormat(format: "H:|[v0]|", views: text)
        NSLayoutConstraint(item: text, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        self.addSubview(image)
        image.isHidden = true
        NSLayoutConstraint(item: image, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: image, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 12).isActive = true
        
        self.addSubview(button)
        self.addConstraintsWithFormat(format: "H:|[v0]|", views: button)
        self.addConstraintsWithFormat(format: "V:|[v0]|", views: button)
        button.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        
    }
    
    private func updateView() {
        if !selected {
            if hasImage { self.image.isHidden = false }
            self.backgroundColor = .white
            self.layer.borderWidth = 2
            self.layer.borderColor = Colors.bgTV.cgColor
            text.textColor = Colors.appGray
        } else {
            if hasImage { self.image.isHidden = true }
            self.backgroundColor = Colors.appBlue
            self.layer.borderWidth = 0
            //self.layer.borderColor = Colors.clear.cgColor
            text.textColor = .white
        }
    }
    
    @objc private func onButtonTapped(sender: UIButton) {
        selected = !selected
    }
    
    
}
