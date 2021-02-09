//
//  LeftView.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/8/21.
//

import UIKit

class LeftView: UIView {
    
    var shadowLayer:CAShapeLayer!
    
    let imgLogo: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "logo")
        imgView.layer.cornerRadius = 4
        imgView.layer.masksToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let imgProfile: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "profile")
        imgView.layer.cornerRadius = 18
        imgView.layer.masksToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()

            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 0).cgPath
            shadowLayer.fillColor = Colors.bgDark.cgColor
            
            shadowLayer.shadowColor = UIColor.gray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 3.0, height: 1.0)
            shadowLayer.shadowOpacity = 0.7
            shadowLayer.shadowRadius = 3
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
    
    
    
    private func initViews() {
        self.backgroundColor = Colors.bgDark
        
        self.addSubview(imgLogo)
        imgLogo.widthAnchor.constraint(equalToConstant: 44).isActive = true
        imgLogo.heightAnchor.constraint(equalToConstant: 44).isActive = true
        NSLayoutConstraint(item: imgLogo, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: imgLogo, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        
        self.addSubview(imgProfile)
        imgProfile.widthAnchor.constraint(equalToConstant: 36).isActive = true
        imgProfile.heightAnchor.constraint(equalToConstant: 36).isActive = true
        NSLayoutConstraint(item: imgProfile, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -30).isActive = true
        NSLayoutConstraint(item: imgProfile, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
    }
    
    
    
}
