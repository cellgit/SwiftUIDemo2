//
//  RoundedCorner.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/9.
//

import SwiftUI

struct RoundedCorner: Shape {
    
    var topLeft: CGFloat = .infinity
    var topRight: CGFloat = .infinity
    var bottomLeft: CGFloat = .infinity
    var bottomRight: CGFloat = .infinity
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.size.width
        let height = rect.size.height
        
        // Ensure the radius doesn't exceed the bounds of the rectangle
        let topRight = min(min(self.topRight, height/2), width/2)
        let topLeft = min(min(self.topLeft, height/2), width/2)
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

