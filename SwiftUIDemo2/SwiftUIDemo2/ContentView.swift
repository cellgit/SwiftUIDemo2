//
//  ContentView.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/7.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Button(action: {
//                // 按钮点击事件
//                print("按钮被点击")
//            }) {
//                Text("按钮")
//                    .font(.title)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue)
//                    .cornerRadius(10)
//            }
//
//            Text("这是一个文本")
//                .font(.headline)
//                .padding()
//        }
//
//        .background(Color.gray)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


import SwiftUI

struct ContainerView: View {
    @State private var phoneNumber: String = ""
    @State private var code: String = ""
    
    let topLeftRadius: CGFloat = 24
    let topRightRadius: CGFloat = 24
    let bottomLeftRadius: CGFloat = 8
    let bottomRightRadius: CGFloat = 8
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                VStack {
                    TextFieldPhone(phoneNumber: $phoneNumber)
                        .padding(30)
                }
                .frame(width: geometry.size.width-32, alignment: .center)
                .background(Color(hex: Colors.secondaryGray.value))
                .clipShape(RoundedCorner(radius: topLeftRadius,
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
                .clipShape(RoundedCorner(radius: 8,
                                        topRight: 8,
                                        bottomLeft: 24,
                                        bottomRight: 24))
                .padding(EdgeInsets.init(top: 4, leading: 16, bottom: 0, trailing: 16))
                
            }
            .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
//            .background(Color(.gray))
            
            
            
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


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var topRight: CGFloat = .infinity
    var bottomLeft: CGFloat = .infinity
    var bottomRight: CGFloat = .infinity
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.size.width
        let height = rect.size.height
        
        // Ensure the radius doesn't exceed the bounds of the rectangle
        let topRight = min(min(self.radius, height/2), width/2)
        let topLeft = min(min(self.topRight, height/2), width/2)
        let bottomRight = min(min(self.bottomRight, height/2), width/2)
        let bottomLeft = min(min(self.bottomLeft, height/2), width/2)
        
        path.move(to: CGPoint(x: width / 2.0, y: 0))
        path.addLine(to: CGPoint(x: width - topRight, y: 0))
        path.addArc(center: CGPoint(x: width - topRight, y: topRight), radius: topRight, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: width, y: height - bottomRight))
        path.addArc(center: CGPoint(x: width - bottomRight, y: height - bottomRight), radius: bottomRight, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: bottomLeft, y: height))
        path.addArc(center: CGPoint(x: bottomLeft, y: height - bottomLeft), radius: bottomLeft, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: topLeft))
        path.addArc(center: CGPoint(x: topLeft, y: topLeft), radius: topLeft, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        return path
    }
}
