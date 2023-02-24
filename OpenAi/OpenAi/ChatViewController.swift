import UIKit
import RxSwift
import RxCocoa
import SnapKit
import OpenAISwift
class ChatViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        textView.layer.cornerRadius = 4
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.systemGray4.cgColor // 设置边框颜色
        textView.backgroundColor = UIColor(dynamicProvider: { traitCollection in
            if traitCollection.userInterfaceStyle == .dark {
                return UIColor(hex: "#3c3d4a")
            } else {
                return .white
            }
        }) // 设置背景颜色
        textView.delegate = self
        return textView
    }()
    
    lazy var senderBtn:UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(scale: .medium)
        let color = UITraitCollection.current.userInterfaceStyle == .dark ? UIColor.white : UIColor(named: "LightModeColor") ?? UIColor(hex: "#3c3d4a")
        let image = UIImage(systemName: "paperplane", withConfiguration: config)?.withTintColor(color, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // 设置背景颜色
        view.addSubview(textView)
        view.addSubview(senderBtn)
        setupConstraints()
        setupRx()
        
        // 创建一个切换主题的按钮
        let toggleThemeButton = UIButton(type: .system)
        toggleThemeButton.setTitle("Mode Change", for: .normal)
        view.addSubview(toggleThemeButton)
        toggleThemeButton.rx.tap.subscribe(onNext: {
            if let keyWindow = UIApplication.shared.keyWindow {
                if keyWindow.overrideUserInterfaceStyle == .light {
                    keyWindow.overrideUserInterfaceStyle = .dark
                } else {
                    keyWindow.overrideUserInterfaceStyle = .light
                }
            }
            
        }).disposed(by: disposeBag)
        
        toggleThemeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(KStatusBarHeight)
            make.leading.equalToSuperview()
            make.width.height.equalTo(44)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                ///背景色
                view.backgroundColor = traitCollection.userInterfaceStyle == .dark ? UIColor(hex: "#3c3d4a") : .white
                
                /// 发送按钮
                let config = UIImage.SymbolConfiguration(scale: .medium)
                let color = UITraitCollection.current.userInterfaceStyle == .dark ? UIColor.white : UIColor(named: "LightModeColor") ?? UIColor(hex: "#3c3d4a")
                let image = UIImage(systemName: "paperplane", withConfiguration: config)?.withTintColor(color, renderingMode: .alwaysOriginal)
                senderBtn.setImage(image, for: .normal)
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    func setupConstraints() {
        textView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-48)
            make.bottom.equalToSuperview().offset(KIsIPhoneXSeries ?  -KSafeAreaBottomHeight : -24)
            make.height.equalTo(36)
        }
        senderBtn.snp.makeConstraints { make in
            make.centerY.equalTo(textView)
            make.trailing.equalToSuperview().offset(-12)
        }
        
     
    }
    
    func setupRx() {
        textView.rx.text
            .orEmpty
            .subscribe(onNext: { [weak self] text in
                guard let self = self else { return }
                let maxHeight: CGFloat = 108 // 5 lines * 18 points per line
                let size = CGSize(width: self.textView.bounds.width, height: maxHeight)
                let estimatedSize = self.textView.sizeThatFits(size)
                let height = min(maxHeight, max(36, estimatedSize.height))
                self.textView.snp.updateConstraints { make in
                    make.height.equalTo(height)
                }
                self.textView.isScrollEnabled = height == maxHeight
            })
            .disposed(by: disposeBag)
    }
}

extension ChatViewController: UITextViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
    
    
//    func requestOpenAIMessage(){
//        let openAI = OpenAISwift(authToken: openAiKey)
//
//        openAI.sendCompletion(with: textView.text, maxTokens: maxToken) { result in // Result<OpenAI, OpenAIError>
//            switch result {
//            case .success(let success):
//                let text = success.choices.first?.text ?? ""
//                print(text)
//                DispatchQueue.main.async {
//                    self.makrView.markdownText = text
//                }
//            case .failure(let failure):
//                print(failure.localizedDescription)
//
//                DispatchQueue.main.async {
//                    self.makrView.markdownText = failure.localizedDescription
//                }
//            }
//        }
//    }
}

