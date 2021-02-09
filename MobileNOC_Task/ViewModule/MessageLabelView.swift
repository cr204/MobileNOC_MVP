//
//  MessageLabelView.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/8/21.
//

import UIKit

class MessageLabelView: UIView {
    
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
        
    }
}
