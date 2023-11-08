//
//  TextFieldPhone.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/8.
//

import SwiftUI

struct TextFieldPhone: View {
    
    @Binding var phoneNumber: String

    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: 8) {
                Image("phone")
                VStack(alignment: .leading) {
                    Text("手机号")
                        .frame(alignment: .leading)
                        .font(Font.system(size: 13, weight: .regular, design: .rounded))
                        .foregroundColor(Color(hex: Colors.text.value))
                    //                            .background(.red)
                    TextField("请输入手机号", text: $phoneNumber)
                        .frame(height: 38)
//                        .border(.gray, width: 1)
                        .keyboardType(.numberPad)
                        .font(Font.system(size: 13, weight: .medium, design: .rounded))
                    //                            .border(Color.gray, width: 1)
                    //                            .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            
        }
        //        .background(.cyan)
        
    }
    
    

    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneRegex = "^1\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneNumber)
    }
}

struct TextFieldPhone_Previews: PreviewProvider {
    
    static var previews: some View {
        TextFieldPhone(phoneNumber: .constant(""))
    }
}


//Button(action: {
//    // 处理输入的手机号
//    if isValidPhoneNumber(phoneNumber) {
//        print("手机号格式正确")
//    } else {
//        print("手机号格式不正确")
//    }
//}) {
//    Text("验证手机号")
//        .foregroundColor(.white)
//        .padding()
//        .background(Color.blue)
//        .cornerRadius(10)
//}
