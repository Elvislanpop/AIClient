//
//  TestViewController.swift
//  OpenAi
//
//  Created by hyd on 2023/2/27.
//

import UIKit
class TestViewController: UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let textView = UITextView(frame: CGRect(x: 12, y: 200, width: 300, height: 100))
        textView.text = "This is a long text that may span multiple lines and exceed the maximum height of five lines.\nThis is a long text that may span multiple lines and exceed the maximum height of five lines.\nThis is a long text that may span multiple lines and exceed the maximum height of five lines.\nThis is a long text that may span multiple lines and exceed the maximum height of five lines.\nThis is a long text that may span multiple lines and exceed the maximum height of five lines.\nThis is a long text that may span multiple lines and exceed the maximum height of five lines."
        textView.font = UIFont.systemFont(ofSize: 17.0)
        textView.adjustHeightForText(maxLines: 5)

        self.view.addSubview(textView)
    }
}
