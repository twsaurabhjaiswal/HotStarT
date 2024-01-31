//
//  Cell.swift
//  HotTV
//
//  Created by Apple on 03/08/23.
//

import SwiftUI

struct Cell: View {
    var record: ListModel
//    @State var isFocus: Bool = false
    @FocusState var onFocusCell: Int?
    @Environment(\.isFocused) var focused: Bool
    var didTap: () -> Void
    var body: some View {
        VStack {
            Button {
                didTap()
            } label: {
                VStack(spacing: 0) {
                    Image(record.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(record.name)
                        .foregroundColor(Color.white)
                }
            }
                .buttonStyle(CellButtonStyle())
        }.frame(width: 280, height: 300, alignment: .center)
            .focused($onFocusCell, equals: record.id)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(onFocusCell == record.id ? Color.white : Color.clear, lineWidth: 3))
        //        .scaleEffect(isFocus ? 1.2 : 1)
        //            .background(focused ? Color.pink : Color.yellow)
        //        .animation(.easeIn(duration: 0.2), value: isFocus)
        //            .background(Color.black)
        //.frame(width: 360, height: 420, alignment: .center)
        //            .background(Color.blue)
        //            .cornerRadius(8)
    }
}
struct CellButtonStyle: ButtonStyle {
    @Environment(\.isFocused) var focused: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10) // Adjust the padding as needed
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Adjust size
    }
}
struct TabBarButtonStyle: ButtonStyle {
    @Environment(\.isFocused) var focused: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(15) // Adjust the padding as needed
            .padding(.horizontal, 30)
            .frame(maxHeight: .infinity) // Adjust size
    }
}
