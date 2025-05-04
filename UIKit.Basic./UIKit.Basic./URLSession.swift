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
        let button = UIButton(
            frame: CGRect(
                x: imageUIImageView.frame.maxX - 250,
                y: imageUIImageView.frame.maxY + 40,
                width: 200,
                height: 50
            )
        )
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.setTitle("Next photo", for: .normal)
        button.addTarget(self, action: #selector(nextPhoto), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame(forAlignmentRect: CGRect(x: 100, y: 200, width: 200, height: 50))
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
        networkManager.sendRequest(query: "cat") { [weak self] urlString in
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
