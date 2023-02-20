//
//  ViewController.swift
//  AiClient
//
//  Created by hyd on 2023/2/18.
//

import UIKit
import SnapKit
import OpenAISwift
import MarkdownView
class ViewController: UIViewController {
    let openAI = OpenAISwift(authToken: "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")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let md = AnimatedMarkdownView(coder: NSCoder())
        view.addSubview(md ?? UIView.init())
        md?.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview()
        }
        
        md?.loadAnimated(markdown: "Swift 网络请求")


        
//        openAI.sendCompletion(with: "Swift 网络请求", maxTokens: 1500) { result in // Result<OpenAI, OpenAIError>
//            switch result {
//            case .success(let success):
//                let showText = success.choices.first?.text ?? ""
//                print(showText)
//                DispatchQueue.main.async {
//                    md.load(markdown: showText)
//                }
//            case .failure(let failure):
//                print(failure.localizedDescription)
//            }
//        }
    }
    

}

