//
//  KeyboardObserver.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/11.
//

/**
 * 键盘监听管理
 */

import SwiftUI

class KeyboardObserver: ObservableObject {
    static let shared = KeyboardObserver()

    @Published var isKeyboardVisible = false

    private init() {}

    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func keyboardWillShow(notification: Notification) {
        isKeyboardVisible = true
    }

    @objc private func keyboardWillHide(notification: Notification) {
        isKeyboardVisible = false
    }
    
    /// 收起键盘
    func hideKeyboard() {
            // 发送一个动作来收起键盘
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
}
