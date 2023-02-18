//
//  ViewController.swift
//  AiClient
//
//  Created by hyd on 2023/2/18.
//

import UIKit
import SnapKit
import OpenAISwift
class ViewController: UIViewController {
    let openAI = OpenAISwift(authToken: "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")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        openAI.sendCompletion(with: "Swift网络请求", model: .gpt3(.davinci)) { result in // Result<OpenAI, OpenAIError>
            switch result {
            case .success(let success):
                print(success.choices.first?.text ?? "")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }

//        let demoLab = TypewriterLabel()
//        demoLab.textColor = .black
//        demoLab.textAlignment = .center
//        demoLab.font = .systemFont(ofSize: 16)
//        self.view.addSubview(demoLab)
//        demoLab.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.equalTo(375)
//            make.height.equalTo(300)
//        }
    }
    
    

}

