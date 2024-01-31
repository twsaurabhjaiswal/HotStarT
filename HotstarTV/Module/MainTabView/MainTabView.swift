//
//  MainTabView.swift
//  HotTV
//
//  Created by Apple on 08/08/23.
//

import SwiftUI

struct MainTabView: View {
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    var body: some View {
        ZStack {
            TabView(selection: $selectedSideMenuTab) {
                DashboardView(presentSideMenu: $presentSideMenu)
                    .tag(0)
                TVView(presentSideMenu: $presentSideMenu)
                    .tag(1)
                ProfileView(presentSideMenu: $presentSideMenu)
                    .tag(2)
                MySpaceView(presentSideMenu: $presentSideMenu)
                    .tag(3)
            }
            SideMenu(isShowing: $presentSideMenu,
                     content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab,
                                                   presentSideMenu: $presentSideMenu)))
        }
    }
}
