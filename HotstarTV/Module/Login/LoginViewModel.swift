//
//  File.swift
//  HotTV
//
//  Created by Apple on 02/08/23.
//

import Foundation
import SwiftUI
struct LoginModel {
    var email: String = "sourabhjaiswal@thoughtwin.com"
    var password: String = "Sj@123"
}
enum Destination: Int, Identifiable {
    case detail1 = 1
    case detail2 = 2
    case language = 3
    var id: Int { self.rawValue } // Implement id based on rawValue
}
class LoginViewModel: ObservableObject {
    @Published var loginModel: LoginModel = LoginModel()
    @Published var isShowPassword: Bool = false
    @Published var isShowDashboard: Bool = false
    @Published var isScale: Bool = false
    @Published var selectedDetail: Destination?
    func navigateAfterFewSeconds(selectedDetail: Destination?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.selectedDetail = selectedDetail
        })
    }
    @ViewBuilder
    func getDestination(item: Destination) -> some View {
        switch item {
        case .detail1:
            DashboardView(presentSideMenu: .constant(false))
        case .detail2:
            VideoPlayerView(seekForward: false, seekBackward: false)
        case .language:
            SelectLanguageView()
        }
    }
}

