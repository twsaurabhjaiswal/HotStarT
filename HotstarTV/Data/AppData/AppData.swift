//
//  AppData.swift
//  HotstarTV
//
//  Created by apple on 10/27/23.
//

import Foundation
final class AppData: NSObject {
    private var isLoginKey = "IsLogin"
    static let shared: AppData = AppData()
    func getUserLoginStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: isLoginKey)
    }
    func setUserLoginStatus(isLogin: Bool) {
        UserDefaults.standard.set(isLogin, forKey: isLoginKey)
    }
}
