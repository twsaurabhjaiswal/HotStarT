//
//  DashboardModel.swift
//  HotTV
//
//  Created by Apple on 03/08/23.
//

import Foundation
struct ListModel: Hashable {
    var name: String = ""
    var location: String = ""
    var date: String = ""
    var time: String = ""
    var price: String = ""
    var image: String = ""
    var id: Int = 0
    var description: String = ""
    var tags: String = ""
    var videoUrl: String = ""
}
struct TabsModel: Hashable {
    var title: String = ""
    var image: String = ""
    var id: Int = 0
}
enum DashboardDestination: Int, Identifiable {
    case playerFullScreen = 1
    case selectLanguage = 2
    case search = 3
    var id: Int { self.rawValue } // Implement id based on rawValue
}
