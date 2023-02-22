
import UIKit
import SnapKit
import OpenAISwift
class ViewController: UIViewController {

    private var makrView:MarkDownView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let markView = MarkDownView(frame: .zero)
        view.addSubview(markView)
        markView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        
        self.makrView = markView
        
        let btn = UIButton.init()
        btn.backgroundColor = .brown
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(44)
        }
        
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
    }
    
    @objc func click(){
        let openAI = OpenAISwift(authToken: "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")
        openAI.sendCompletion(with: "写一段markdown文本", maxTokens: 500) { result in // Result<OpenAI, OpenAIError>
            switch result {
            case .success(let success):
                let text = success.choices.first?.text ?? ""
                print(text)
                DispatchQueue.main.async {
                    self.makrView.markdownText = text
                }
            case .failure(let failure):
                print(failure.localizedDescription)
                
                DispatchQueue.main.async {
                    self.makrView.markdownText = failure.localizedDescription
                }
            }
        }

    }
 
}

