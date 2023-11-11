//
//  ContentView.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/7.
//

import SwiftUI
import IQKeyboardManagerSwift

struct ContainerView: View {
    @State private var password: String = ""
    @State private var passwordSecond: String = ""
    @State private var phoneNumber: String = ""
    @State private var code: String = ""
    
    
    let topLeftRadius: CGFloat = 24
    let topRightRadius: CGFloat = 24
    let bottomLeftRadius: CGFloat = 8
    let bottomRightRadius: CGFloat = 8
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView{
                VStack(alignment: .center, spacing: 0) {
                    VStack {
                        TextFieldPhone(phoneNumber: $phoneNumber, topLeft: 24, topRight: 24, bottomLeft: 8, bottomRight: 8) { res in
                            debugPrint("res: \(res)")
                        }
                    }
//                    .frame(width: geometry.size.width-32, alignment: .center)
                    .padding(EdgeInsets.init(top: 100, leading: 16, bottom: 0, trailing: 16))
                    
                    VStack {
                        TextFieldCode(code: $code, title: "验证码", placeholder: "请输入验证码", topLeft: 8, topRight: 8, bottomLeft: 24, bottomRight: 24) { res in
                            debugPrint("res: \(res)")
                        }
                    }
//                    .frame(width: geometry.size.width-32, alignment: .leading)
                    .padding(EdgeInsets.init(top: 4, leading: 16, bottom: 0, trailing: 16))
                    
                    VStack {
                        TextFieldPassword(password: $password, isOpen: false, title: "请输入密码", placeholder: "密码", topLeft: 24, topRight: 24, bottomLeft: 8, bottomRight: 8) { pwd in
                            debugPrint("pwd: \(pwd)")
                            debugPrint("password3: \(password)")
                            
                        }
                    }
                    .padding(EdgeInsets.init(top: 40, leading: 16, bottom: 0, trailing: 16))
                    
                    VStack {
                        TextFieldPassword(password: $passwordSecond, isOpen: false, title: "请再次输入密码", placeholder: "再次输入密码", topLeft: 8, topRight: 8, bottomLeft: 24, bottomRight: 24) { pwd in
                            debugPrint("passwordSecond4: \(passwordSecond)")
                        }
                    }
                    .padding(EdgeInsets.init(top: 4, leading: 16, bottom: 0, trailing: 16))
                    
                }
                .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                
//                .background(Color(.gray))
                
                
                
            }
            .onTapGesture {
                print("onTapGesture")
                // 点击视图时收起键盘
                KeyboardObserver.shared.hideKeyboard()
            }
            .onAppear {
                print("onAppear")
                // 注册键盘观察器
                KeyboardObserver.shared.addObserver()
            }
            .onDisappear {
                print("onAppear")
                // 在视图消失时取消注册键盘观察器
                KeyboardObserver.shared.removeObserver()
            }
            .background(IQKeyboardManagerSwiftWrapper())
            
            
            
        }
        
        
    }
        
        
        
}

struct ContentView: View {
    var body: some View {
        ZStack {
//            Color.gray // 为父容器设置灰色背景
            ContainerView()
        }
        .edgesIgnoringSafeArea(.all)
//
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
