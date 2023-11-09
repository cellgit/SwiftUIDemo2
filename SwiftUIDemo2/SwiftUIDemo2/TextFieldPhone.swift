//
//  TextFieldPhone.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/8.
//

import SwiftUI

struct TextFieldPhone: View {
    
    @Binding var phoneNumber: String
    
    var title: String = "title"
    var placeholder: String = "placeholder"
    var topLeft: CGFloat
    var topRight: CGFloat
    var bottomLeft: CGFloat
    var bottomRight: CGFloat
    var callback: (String) -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: 8) {
                Image("phone")
                VStack(alignment: .leading) {
                    Text("手机号")
                        .frame(alignment: .leading)
                        .font(Font.system(size: 13, weight: .regular, design: .rounded))
                        .foregroundColor(Color(hex: Colors.text.value))
                    TextField("请输入手机号", text: $phoneNumber)
                        .frame(height: 38)
//                        .border(.gray, width: 1)
                        .keyboardType(.numberPad)
                        .font(Font.system(size: 13, weight: .medium, design: .rounded))
//                        .border(Color.gray, width: 1)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
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
    
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneRegex = "^1\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneNumber)
    }
}

struct TextFieldPhone_Previews: PreviewProvider {
    
    static var previews: some View {
        TextFieldPhone(phoneNumber: .constant(""), topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8) { res in
            debugPrint("phoneNumber: \(res)")
        }
    }
}
