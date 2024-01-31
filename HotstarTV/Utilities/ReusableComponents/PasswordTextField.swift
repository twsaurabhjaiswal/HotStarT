//
//  File.swift
//  HotTV
//
//  Created by Apple on 02/08/23.
//

import Foundation
import SwiftUI
struct PasswordTextField: View {
    @Binding var isShowPassword: Bool
    @Binding var passwordText: String
    var body: some View {
        HStack {
            if isShowPassword {
                TextField("Password: ", text: $passwordText)
                    .font(.headline)
            } else {
                SecureField("Password: ", text: $passwordText)
                    .font(.headline)
            }
            Button {
                isShowPassword.toggle()
            } label: {
                Image(isShowPassword ? AppImages.GlobalImages.eyeClose : AppImages.GlobalImages.eye)
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
            }
        }.font(.system(size: 14, weight: .regular))
            .foregroundColor(Color.gray)
            .padding(.horizontal, 6)
            .padding(.vertical, 13)
    }
}
