//
//  MySpace.swift
//  HotTV
//
//  Created by Apple on 08/08/23.
//

import SwiftUI

struct MySpaceView: View {
    @Binding var presentSideMenu: Bool
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image("menu")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
            }
            Spacer()
            Text("My Space View")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}
