//
//  ContentView.swift
//  SwiftUIDemo2
//
//  Created by liuhongli on 2023/11/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            VStack{
                
                Button {
                    //
                } label: {
                    Text("Button")
                }
                .frame(width: 200, height: 100, alignment: .center)
                .border(.blue, width: 1)
                .foregroundColor(.blue)
                .backgroundStyle(.orange)
                

            }
            .frame(width: 200, height: 200, alignment: .center)
            .foregroundColor(.gray)
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
