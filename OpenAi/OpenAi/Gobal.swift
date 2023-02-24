//
//  Gobal.swift
//  OpenAi
//
//  Created by hyd on 2023/2/24.
//

import UIKit

// 屏幕尺寸
let KScreenWidth = UIScreen.main.bounds.size.width
let KScreenHeight = UIScreen.main.bounds.size.height
let KScreenBounds = UIScreen.main.bounds

// 安全区域
var KSafeAreaInsets: UIEdgeInsets {
    if #available(iOS 11.0, *) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return windowScene.windows.first?.safeAreaInsets ?? UIEdgeInsets.zero
        }
    }
    return UIEdgeInsets.zero
}


// 判断是否为刘海屏
var KIsIPhoneXSeries: Bool {
    if #available(iOS 11.0, *) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let bottomInset = windowScene.windows.first?.safeAreaInsets.bottom ?? 0
            return bottomInset > 0
        }
    }
    return false
}


// 状态栏高度
let KStatusBarHeight: CGFloat = KIsIPhoneXSeries ? 44.0 : 20.0

// 导航栏高度
let KNavigationBarHeight: CGFloat = 44.0

// TabBar高度
let KTabBarHeight: CGFloat = KIsIPhoneXSeries ? 83.0 : 49.0

// 底部安全区域高度
let KSafeAreaBottomHeight: CGFloat = KIsIPhoneXSeries ? 34.0 : 0.0
