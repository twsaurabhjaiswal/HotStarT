//
//  SideMenuUIKit.swift
//  HotstarTV
//
//  Created by Apple on 08/08/23.
//

import Foundation
import SwiftUI
import UIKit

struct ContentView: View {
    @State private var isSideMenuVisible = false
    var body: some View {
        VStack {
            ZStack {
                Button("on/off") {
                    withAnimation {
                        isSideMenuVisible.toggle()
                    }
                }
                SideMenuu(isOpen: $isSideMenuVisible)
            }
            Spacer()
        }.ignoresSafeArea(.all)
    }
}

struct SideMenuu: View {
    @Binding var isOpen: Bool
    
    var body: some View {
        ZStack {
//            if isOpen {
                Color.pink.opacity(isOpen ? 0.5 : 0)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Text("Menu Item 1")
                        .foregroundColor(.black)
                    Text("Menu Item 2")
                        .foregroundColor(.black)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .offset(x: isOpen ? 0 : -1000)
                .animation(.easeInOut(duration: 0.3))
                .frame(width: 300)
            }
//        }
    }
}
