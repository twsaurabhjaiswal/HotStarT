//
//  TabBarView.swift
//  HotTV
//
//  Created by Apple on 04/08/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        NavigationView {
            HStack {
                TabView {
                    DashboardView(presentSideMenu: .constant(true))
                        .tabItem {
                            Text("For You")
                                .foregroundColor(Color.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                    FreeView()
                        .tabItem {
                            Text("Free")
                                .foregroundColor(Color.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                    SportsView()
                        .tabItem {
                            Text("Sports")
                                .foregroundColor(Color.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                    PremiumView()
                        .tabItem {
                            Text("Premium You")
                                .foregroundColor(Color.white)
                                .font(.system(size: 20, weight: .bold))
                        }
                }//.background(Color.red)
            }
//            .ignoresSafeArea(.all, edges: .horizontal)
//            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
