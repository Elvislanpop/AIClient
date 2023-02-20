//
//  AnimatedMarkdownView.swift
//  AiClient
//
//  Created by hyd on 2023/2/20.
//

import MarkdownView
import Foundation
class AnimatedMarkdownView: MarkdownView {
    private var markdown: String = ""
    private var currentIndex: Int = 0
    private var timer: Timer?
    private let animationInterval: TimeInterval = 0.1
    

    
    func loadAnimated(markdown: String) {
        self.markdown = markdown
        currentIndex = 0
        timer = Timer.scheduledTimer(withTimeInterval: animationInterval, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            guard self.currentIndex < self.markdown.count else {
                timer.invalidate()
                return
            }
            let startIndex = self.markdown.startIndex
            let endIndex = self.markdown.index(startIndex, offsetBy: self.currentIndex)
            let subString = String(self.markdown[startIndex...endIndex])
            self.currentIndex += 1
            self.loadOneCharacter(subString)
        }
    }


    private func loadOneCharacter(_ subString: String) {
        super.load(markdown: subString)
        self.setNeedsDisplay()
    }
    

  

}
