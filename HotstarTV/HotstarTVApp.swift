//
//  HotTVApp.swift
//  HotTV
//
//  Created by Apple on 02/08/23.
//

import SwiftUI

@main
struct HotTVApp: App {
    var body: some Scene {
        WindowGroup {
//            if AppData.shared.getUserLoginStatus() {
                DashboardView(presentSideMenu: .constant(true))
//            } else {
//                LoginView()
//            }
        }
    }
}
