//
//  Extension.swift
//  OpenAi
//
//  Created by hyd on 2023/2/24.
//
import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
extension String {
    static func DateToString(from date: Date = Date(), format: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}




extension UITextView {
    func adjustHeightForText(maxLines: Int) {
        guard let text = self.text, !text.isEmpty else {
            return
        }

        let font = self.font ?? UIFont.systemFont(ofSize: 17.0)
        let maxWidth = self.frame.width
        let calculatedHeight = calculateLabelHeight(withText: text, font: font, maxWidth: maxWidth, maxLines: maxLines)

        if calculatedHeight > font.lineHeight * CGFloat(maxLines) {
            // 当文本的高度超过了5行的高度，使用滑动显示
            self.isScrollEnabled = true
            self.heightAnchor.constraint(equalToConstant: font.lineHeight * CGFloat(maxLines)).isActive = true
            self.setContentHuggingPriority(.required, for: .vertical)
            self.setContentCompressionResistancePriority(.required, for: .vertical)
        } else {
            // 当文本的高度不超过5行的高度，直接显示全部文本
            self.isScrollEnabled = false
            self.heightAnchor.constraint(equalToConstant: calculatedHeight).isActive = true
        }
    }
    func calculateLabelHeight(withText text: String, font: UIFont, maxWidth: CGFloat, maxLines: Int) -> CGFloat {
        let textStorage = NSTextStorage(string: text)
        let textContainer = NSTextContainer(size: CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude))
        textContainer.lineFragmentPadding = 0.0
        textContainer.maximumNumberOfLines = maxLines

        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)

        textStorage.addAttribute(.font, value: font, range: NSRange(location: 0, length: textStorage.length))
        textStorage.addLayoutManager(layoutManager)

        let height = layoutManager.usedRect(for: textContainer).height
        return height
    }

}



