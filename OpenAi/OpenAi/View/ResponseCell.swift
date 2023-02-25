//
//  ResponseCell.swift
//  OpenAi
//
//  Created by hyd on 2023/2/25.
//

import UIKit
class ResponseCell: UITableViewCell {
    var model:SaveModel?{
        didSet{
            setModel()
        }
    }
    private var contentLab:UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let tipLab = UILabel(frame: .zero)
        tipLab.backgroundColor = .cyan
        tipLab.text = "A"
        tipLab.textAlignment = .center
        tipLab.textColor = .white
        tipLab.font = .systemFont(ofSize: 16)
        self.contentView.addSubview(tipLab)
        tipLab.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(12)
            make.width.height.equalTo(44)
        }
        tipLab.layer.cornerRadius = 22

        
        let contentLab = UILabel(frame: .zero)
        contentLab.textColor = .black
        contentLab.textAlignment = .right
        contentLab.font = .systemFont(ofSize: 16)
        contentLab.numberOfLines = 0
        self.contentView.addSubview(contentLab)
        contentLab.snp.makeConstraints { make in
            make.top.equalTo(tipLab)
            make.leading.equalTo(tipLab.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-12)
        }
        self.contentLab = tipLab

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if #available(iOS 13.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                self.backgroundColor = UIColor(hex: "#3c3d4a")
                self.contentLab.textColor = .white

            } else {
                self.backgroundColor = UIColor(hex: "#f6f6f7")
                self.contentLab.textColor = .black
            }
        } else {
            self.backgroundColor = UIColor(hex: "#f6f6f7")
            self.contentLab.textColor = .black
        }
    }
    
    func setModel(){
        guard let model = model else { return  }
        self.contentLab.text = model.answer
    }
}

