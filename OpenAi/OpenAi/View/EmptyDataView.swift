//
//  EmptyDataView.swift
//  OpenAi
//
//  Created by hyd on 2023/2/25.
//

import UIKit
class EmptyDataView: UIView {
    let  label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "Powered By OpenAI"
        label.textColor = UIColor(hex: "4d4d5e",alpha: 0.5)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if #available(iOS 13.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                label.textColor = UIColor(hex: "ffffff",alpha: 0.5)
            } else {
                label.textColor = UIColor(hex: "4d4d5e",alpha: 0.5)
            }
        } else {
            label.textColor = UIColor(hex: "4d4d5e",alpha: 0.5)
        }
    }
}
