//
//  ContentView.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/7.
//

import SwiftUI

struct ContainerView: View {
    @State private var phoneNumber: String = ""
    @State private var code: String = ""
    
    @State private var password: String = ""
    
    let topLeftRadius: CGFloat = 24
    let topRightRadius: CGFloat = 24
    let bottomLeftRadius: CGFloat = 8
    let bottomRightRadius: CGFloat = 8
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView{
                VStack(alignment: .center, spacing: 0) {
                    VStack {
                        TextFieldPhone(phoneNumber: $phoneNumber)
                            .padding(30)
                    }
                    .frame(width: geometry.size.width-32, alignment: .center)
                    .background(Color(hex: Colors.secondaryGray.value))
                    .clipShape(RoundedCorner(topLeft: topLeftRadius,
                                             topRight: topRightRadius,
                                             bottomLeft: bottomLeftRadius,
                                             bottomRight: bottomRightRadius))
                    .padding(EdgeInsets.init(top: 100, leading: 16, bottom: 0, trailing: 16))
                    
                    VStack {
                        TextFieldCode(code: $code)
                            .padding(30)
                    }
                    .frame(width: geometry.size.width-32, alignment: .leading)
                    .background(Color(hex: Colors.secondaryGray.value))
                    .clipShape(RoundedCorner(topLeft: 8,
                                             topRight: 8,
                                             bottomLeft: 24,
                                             bottomRight: 24))
                    .padding(EdgeInsets.init(top: 4, leading: 16, bottom: 0, trailing: 16))
                    
                    VStack {
                        TextFieldPassword(isOpen: false, title: "请输入密码", placeholder: "密码", topLeft: 24, topRight: 24, bottomLeft: 8, bottomRight: 8) { pwd in
                            debugPrint("pwd: \(pwd)")
                        }
                    }
                    .padding(EdgeInsets.init(top: 40, leading: 16, bottom: 0, trailing: 16))
                    
                    VStack {
                        TextFieldPassword(isOpen: false, title: "请再次输入密码", placeholder: "再次输入密码", topLeft: 8, topRight: 8, bottomLeft: 24, bottomRight: 24) { pwd in
                            debugPrint("pwd: \(pwd)")
                        }
                    }
                    .padding(EdgeInsets.init(top: 4, leading: 16, bottom: 0, trailing: 16))
                    
                }
                .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
//                .background(Color(.gray))
                
                
            }
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
