//
//  File.swift
//  HotstarTV
//
//  Created by apple on 10/27/23.
//

import Foundation
import SwiftUI
struct SelectLanguageView: View {
    let row = [
        GridItem(.adaptive(minimum: 400))
    ]
    var viewModel: SelectLanguageViewModel = SelectLanguageViewModel()
    var body: some View {
        VStack {
//            Spacer()
            HStack(spacing: 0) {
                Image("Speaker")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.trailing, 10)
                Text("Choose your favourite language")
                    .foregroundColor(Color.white)
                    .font(.system(size: 50, weight: .heavy))
            }
            Spacer()
            LazyVGrid(columns: row) {
                ForEach(viewModel.arrayOfLanguage, id: \.self) { item in
                    Button {
                        
                    } label: {
                        Text(item.languageName)
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color.white)
                            
                    }
                }
            }.padding(.top, 20)
            LazyVGrid(columns: row) {
                ForEach(viewModel.arrayOfLanguage, id: \.self) { item in
                    Button {
                        
                    } label: {
                        Text(item.languageName)
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color.white)
                            
                    }
                }
            }.padding(.top, 20)
            LazyVGrid(columns: row) {
                ForEach(viewModel.arrayOfLanguage, id: \.self) { item in
                    Button {
                        
                    } label: {
                        Text(item.languageName)
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color.white)
                            
                    }
                }
            }.padding(.top, 20)
            Spacer()
        }.background(Color.blue.opacity(0.5))//.opacity(0.5)
    }
}
