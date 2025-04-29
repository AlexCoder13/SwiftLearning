//
//  VC.swift
//  UIKit.Basic.
//
//  Created by Александр Семёнов on 29.04.2025.
//

import UIKit

class MyViewController: UIViewController {
    
    // MARK: - ФУНКЦИИ ЖИЗНЕННОГО ЦИКЛА VC
    // Вьюха загружается в память
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    // Вьюха уже загрузилась в память
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    // Вьюха готовится к появлению на экране
    override func viewWillAppear(_ animated: Bool) {
        print("Начинаю показывать view -- viewWillAppear")
    }
    
    // Вьюха полностью показана на экране
    override func viewDidAppear(_ animated: Bool) {
        print("View полностью на экране -- viewDidAppear")
    }
    
    // Вьюха начинает исчезать с экрана
    override func viewWillDisappear(_ animated: Bool) {
        print("Начинаю скрывать view -- viewWillDisappear")
    }
    
    // Вьюха полностью исчезла с экрана
    override func viewDidDisappear(_ animated: Bool) {
        print("View скрыт -- viewDidDisappear")
    }
    
    
    // эти функции вызываются, когда перестраиваются наши вьюхи (например разные ориентации экрана)
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
}


// MARK: - Удаление StoryBoard.
/*
 1. Удаляем сам файл Сторидобрда.
 2. Идем в INFO в настройках прилы и удаляем "Main Storybord file base name"
 3. Идем в info.plist, разворачиваем Application Scene Manifest полностью и удаляем "Storyboard Name"
 
 Теперь приложению нужно дать понять, какой экран главный и с какого экрана ему нужно запускаться.
 1. Идем в SceneDelegate, в func scene:
 - делаем сцену (guard let scene = (scene as? UIWindowScene) else { return })
 - инициализируем window (self.window = UIWindow(windowScene: scene))
 - говорим, какой экран будет главным (self.window?.rootViewController = MyViewController())
 */
