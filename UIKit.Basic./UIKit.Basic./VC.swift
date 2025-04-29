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
        
        // Устанавливаем цвет Вьюхи
        view.backgroundColor = .lightGray
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
    
    
    // MARK: - Создание элементов кодом
    let pageTitle1: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 36)
        return label
    }()
    // или
    let pageTitle2 = UILabel()
    // а функцию писать во viewDidLoad, или сразу свойства писать во viewDidLoad, но это плохой КодСтайл
    func setupPageTitle2() {
        pageTitle2.text = "Hello, World!"
        pageTitle2.textAlignment = .center
        pageTitle2.font = UIFont.systemFont(ofSize: 36)
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
 - отображаем наш Контроллер (self.window?.makeKeyAndVisible())
 */
