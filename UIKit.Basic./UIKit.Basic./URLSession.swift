//
//  URLSession.swift
//  UIKit.Basic.
//
//  Created by Александр Семёнов on 02.05.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let networkManager = NetworkManager() // Создаем экземпляр
    
    private lazy var imageUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame.size = CGSize(width: 300, height: 300)
        imageView.center = view.center
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var nextPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next photo", for: .normal)
        button.addTarget(self, action: #selector(nextPhoto), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
[
    button.bottomAnchor
                .constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                    constant: -16
                ),
    button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
    button.trailingAnchor
        .constraint(equalTo: view.trailingAnchor, constant: 16),
        ]
)
        return button
    }()
    
    @objc
    fileprivate func nextPhoto() {
        networkManager.sendRequest(query: "cat") { [weak self] urlString in
            guard let self = self else { return }
            guard let urlString = URL(string: urlString) else { return }
            self.imageUIImageView.load(url: urlString)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        view.addSubview(imageUIImageView)
        view.addSubview(nextPhotoButton)
        
        // Отправляем запрос
        networkManager.sendRequest(query: "car") { [weak self] urlString in
            guard let self = self else { return }
            guard let urlString = URL(string: urlString) else { return }
            imageUIImageView.load(url: urlString)
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let data = try? Data(contentsOf: url) else { return }
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
