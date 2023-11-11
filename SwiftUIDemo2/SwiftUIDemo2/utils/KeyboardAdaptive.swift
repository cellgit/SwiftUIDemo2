//
//  KeyboardAdaptive.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/11.
//

import SwiftUI
import IQKeyboardManagerSwift

struct IQKeyboardManagerSwiftWrapper: UIViewRepresentable {
    class Coordinator: NSObject {
        var parent: IQKeyboardManagerSwiftWrapper

        init(parent: IQKeyboardManagerSwiftWrapper) {
            self.parent = parent
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        // 配置 IQKeyboardManagerSwift
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
