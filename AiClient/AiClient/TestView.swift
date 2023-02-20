////
////  TestView.swift
////  AiClient
////
////  Created by hyd on 2023/2/20.
////
//
//import UIKit
//import MarkdownView
//
//class AnimatedMarkdownView: MarkdownView {
//
//    var textArray: [String] = []
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        textArray = self.text.components(separatedBy: " ")
//        self.text = ""
//    }
//    
//    func animateText() {
//        if !textArray.isEmpty {
//            let string = textArray.removeFirst()
//            let newText = self.text + " " + string
//            self.text = newText
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                self.animateText()
//            }
//        }
//    }
//    
//    convenience init(text: String) {
//        self.init()
//        self.textArray = text.components(separatedBy: " ")
//        self.text = ""
//    }
//}
//
//let markdownView = AnimatedMarkdownView(text: "This is some sample text to be displayed.")
//
