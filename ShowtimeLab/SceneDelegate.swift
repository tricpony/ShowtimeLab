//
//  SceneDelegate.swift
//  ShowtimeLab
//
//  Created by aarthur on 8/10/22.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = HomeViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
