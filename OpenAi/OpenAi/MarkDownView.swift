
import UIKit
import Down
import SnapKit

class MarkDownView: UIView {
    
    let textView = UITextView()
    
    var currentIndex = 0
    
    var timer: Timer?
    
    var markdownText = "" {
        didSet {
            timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] timer in
                guard let self = self else {
                    timer.invalidate()
                    return
                }
                
                let attributedString = self.attributedString(with: self.currentIndex)
                self.textView.attributedText = attributedString
                
                if self.currentIndex >= self.markdownText.count {
                    timer.invalidate()
                    self.currentIndex = 0
                }
                
                self.currentIndex += 1
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textView)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attributedString(with endIndex: Int) -> NSAttributedString {
        let index = markdownText.index(markdownText.startIndex, offsetBy: endIndex)
        let substring = markdownText[..<index]
        
        let down = Down(markdownString: String(substring))
        
        let html = try! down.toHTML()
        let attributedString = try! NSAttributedString(data: html.data(using: .unicode)!, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        
        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 0, length: attributedString.length))
        
        return mutableAttributedString
        
//        return attributedString
    }
}


