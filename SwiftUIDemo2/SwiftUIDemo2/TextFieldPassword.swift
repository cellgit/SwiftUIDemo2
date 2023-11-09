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
    
    var title: String = ""
    var placeholder: String = ""
    var topLeft: CGFloat
    var topRight: CGFloat
    var bottomLeft: CGFloat
    var bottomRight: CGFloat
    var callback: (String) -> Void
    
    @ViewBuilder
    var passwordField: some View {
        if isOpen {
            TextField(placeholder, text: $password) {
                debugPrint("password1: \(password)")
                callback(password)
                
            }
        }
        else {
            SecureField(placeholder, text: $password) {
                debugPrint("password2: \(password)")
                callback(password)
                
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack(alignment: .center, spacing: 8) {
                VStack(alignment: .leading) {
                    Text(title)
                        .frame(alignment: .leading)
                        .font(Font.system(size: 13, weight: .regular, design: .rounded))
                        .foregroundColor(Color(hex: Colors.text.value))
                    passwordField
                        .frame(height: 38)
//                        .border(.gray, width: 1)
                        .keyboardType(.numberPad)
                        .font(Font.system(size: 13, weight: .medium, design: .rounded))
//                        .border(Color.gray, width: 1)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
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
        .padding(24)
        .background(Color(hex: Colors.secondaryGray.value))
        .clipShape(RoundedCorner(topLeft: topLeft,
                                 topRight: topRight,
                                 bottomLeft: bottomLeft,
                                 bottomRight: bottomRight))
    }
}

struct TextFieldPassword_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldPassword(password: .constant(""), topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8) { password in
            debugPrint("password: \(password)" )
        }
    }
}
