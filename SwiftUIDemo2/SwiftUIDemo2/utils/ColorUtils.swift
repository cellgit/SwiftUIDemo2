//
//  ColorUtils.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/8.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        var hexString = hex
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        let scanner = Scanner(string: hexString)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xFF0000) >> 16
        let g = (rgbValue & 0x00FF00) >> 8
        let b = rgbValue & 0x0000FF
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }
}


enum Colors {
    // 蓝色 (主要按钮)
    case primaryBlue
    // 橙色
    case primaryOrange
    // 红色
    case primaryRed
    // 亮绿色
    case primaryLightGreen
    // 深绿色
    case primaryDarkGreen
    // 蓝色2
    case secondaryBlue
    // 灰色2 (次要按钮))
    case secondaryGray
    // 主要蓝禁用色
    case primaryBlueUnable
    // 正文字体色
    case text
    // 次级文本色 || 禁用按钮文本灰色
    case text2
    // 说明文本,弱化文本色
    case text3
    
    var value: String {
        switch self {
        case .primaryBlue:
            return "#0D5EFE"
        case .primaryOrange:
            return "#FBC659"
        case .primaryRed:
            return "#F04C42"
        case .primaryLightGreen:
            return "#0DCCCC"
        case .primaryDarkGreen:
            return "#4FA25B"
        case .secondaryBlue:
            return "#5780F7"
        case .secondaryGray:
            return "#F0F3F9"
        case .primaryBlueUnable:
            return "#0D5EFE4D"
        case .text:
            return "#131232"
        case .text2:
            return "#13123299"
        case .text3:
            return "#13123240"
        }
    }
    
}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            // 使用hex色值
//            Text("Hello, World!")
//                .foregroundColor(Color(hex: "#FF0000")) // 设置红色
//        }
//    }
//}
//
//@main
//struct MyApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
