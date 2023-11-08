//
//  TextFieldCode.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/8.
//

import SwiftUI

struct TextFieldCode: View {
    
    @Binding var code: String

    var body: some View {
        
            VStack(alignment: .trailing) {
                HStack(alignment: .center, spacing: 8) {
                    Image("phone")
                    HStack(alignment: .center, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("验证码")
                                .frame(alignment: .leading)
                                .font(Font.system(size: 13, weight: .regular, design: .rounded))
                                .foregroundColor(Color(hex: Colors.text.value))
                            TextField("请输入验证码", text: $code)
                                .keyboardType(.numberPad)
                                .font(Font.system(size: 13, weight: .medium, design: .rounded))
//                                .border(Color.gray, width: 1)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        
                        
                        
                        
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0) {
                        CountdownTimerView(countdownDuration: 10)
                    }
                }
                
                
                
            }
            
        
    }
    
    

    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneRegex = "^1\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneNumber)
    }
}

struct TextFieldCode_Previews: PreviewProvider {
    
    static var previews: some View {
        TextFieldCode(code: .constant(""))
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

