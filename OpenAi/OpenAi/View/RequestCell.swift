//
//  RequestCell.swift
//  OpenAi
//
//  Created by hyd on 2023/2/25.
//

import UIKit
class RequestCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if #available(iOS 13.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                self.backgroundColor = UIColor(hex: "#2e2e39")
            } else {
                self.backgroundColor = .white
            }
        } else {
            self.backgroundColor = .white
        }
    }
}
