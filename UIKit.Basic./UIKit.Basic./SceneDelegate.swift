//
//  SceneDelegate.swift
//  UIKit.Basic.
//
//  Created by Александр Семёнов on 29.04.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

// MARK: - УДАЛИЛИ СТОРИБОРД. Что дальше?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // 1 - создаем сцену
        guard let scene = (scene as? UIWindowScene) else { return }
        
        // 2 - инициализируем window
        self.window = UIWindow(windowScene: scene)
        
        // 3 - какой экран будет главным
        self.window?.rootViewController = MyViewController()
        
        // 4 - отображаем наш Контроллер
        self.window?.makeKeyAndVisible()
    }
}

