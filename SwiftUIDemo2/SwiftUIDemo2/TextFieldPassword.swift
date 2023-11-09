//
//  TextFieldPassword.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/9.
//

import SwiftUI

struct TextFieldPassword: View {
    @Binding var password: String
    @State var isOpen: Bool = false
    var body: some View {
        VStack(alignment: .trailing) {
            HStack(alignment: .center, spacing: 8) {
                VStack(alignment: .leading) {
                    Text("请输入密码")
                        .frame(alignment: .leading)
                        .font(Font.system(size: 13, weight: .regular, design: .rounded))
                        .foregroundColor(Color(hex: Colors.text.value))
                    TextField("请再次输入密码", text: $password)
                        .frame(height: 38)
                        .border(.gray, width: 1)
                        .keyboardType(.numberPad)
                        .font(Font.system(size: 13, weight: .medium, design: .rounded))
                        .border(Color.gray, width: 1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Button {
                        isOpen = !isOpen
                    } label: {
                        isOpen == true ? Image("eye_open") : Image("eye_close")
                    }
                }
            }
        }
    }
}

struct TextFieldPassword_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldPassword(password: .constant(""))
    }
}
