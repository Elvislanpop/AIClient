//
//  TypewriterLabel.swift
//  AiClient
//
//  Created by hyd on 2023/2/18.
//

import UIKit
class TypewriterLabel: UILabel {
    private var currentIndex = 0
    private var currentText: String?
    private var timer: Timer?

    
    func animate(newText: String) {
        currentIndex = 0
        currentText = newText
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateText), userInfo: nil, repeats: true)
    }

    @objc private func updateText() {
        guard let text = currentText else {
            return
        }
        if currentIndex > text.count {
            timer?.invalidate()
            timer = nil
            return
        }
        let attributedText = NSAttributedString(string: String(text.prefix(currentIndex)))
        self.attributedText = attributedText
        currentIndex += 1
    }
}
