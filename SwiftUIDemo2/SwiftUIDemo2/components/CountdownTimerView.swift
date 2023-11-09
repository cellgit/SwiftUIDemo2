//
//  CountdownTimerView.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/8.
//

import SwiftUI

struct CountdownTimerView: View {
    let countdownDuration: TimeInterval
    
    @State private var isCountingDown = false
    @State private var remainingTime: TimeInterval = 0
    
    private let timer = Timer.publish(every: 1, on: .main, in: .default)
        .autoconnect()
        .eraseToAnyPublisher()
    
    var body: some View {
        VStack {
            if isCountingDown {
                Text("重新发送 (\(Int(remainingTime))s)")
                    .lineLimit(1)
                    .foregroundColor(Color(hex: Colors.text3.value))
                    .font(Font.system(size: 13, weight: .regular))
                    .onReceive(timer) { _ in
                        if remainingTime > 0 {
                            remainingTime -= 1
                        } else {
                            stopCountdown()
                        }
                    }
            } else {
                Button(action: startCountdown) {
                    Text("获取验证码")
                        .lineLimit(1)
                        .foregroundColor(.blue)
                        .font(Font.system(size: 13, weight: .regular))
                }
            }
        }
    }
    
    private func startCountdown() {
        isCountingDown = true
        remainingTime = countdownDuration
    }
    
    private func stopCountdown() {
        isCountingDown = false
        remainingTime = 0
    }
}

struct CountdownTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimerView(countdownDuration: 10)
    }
}

