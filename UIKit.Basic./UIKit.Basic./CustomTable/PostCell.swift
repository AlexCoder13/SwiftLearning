//
//  PostCell.swift
//  UIKit.Basic.
//
//  Created by Александр Семёнов on 30.04.2025.
//

import UIKit

//MARK: - Создаем КАСТОМНУЮ ячейку
class PostCell: UITableViewCell {
    
    // Сразу задаем идентификатор для ячейки, чтобы использовать его в контроллере сразу через свойство
    static let reuseId = "PostCell"
    
    // Создаем UI-элементы через свойство
    var postCellView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var postCellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 134).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var postCellHeader = getLabel(font: .systemFont(ofSize: 20, weight: .bold))
    lazy var postCellDescription = getLabel(font: .systemFont(ofSize: 16, weight: .medium))
    
    var postCellBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Подробнее", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Создаем шаблон UI-элемента через функцию
    private func getLabel(font: UIFont) -> UILabel {
        {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = font
            $0.numberOfLines = 0
            return $0
        }(UILabel())
    }
    
    
    // Обязательные инициализаторы
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Добавляем все элементы на Вьюху ячейки
        contentView.addSubview(postCellView) // Добавляем нашу вьюху на родную вьюху ячейки
        postCellView.addSubview(postCellImage)
        postCellView.addSubview(postCellBtn)
        postCellView.addSubview(postCellHeader)
        postCellView.addSubview(postCellDescription)
        
        // Вызываем функцию
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // В эту функцию приходят наши данные
    func setupCell(with post: Post) {
        postCellImage.image = UIImage(named: post.image)
        postCellHeader.text = post.header
        postCellDescription.text = post.text
    }
    
    // Установим Констрейны элементов
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            postCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            postCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            postCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            postCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            postCellImage.topAnchor.constraint(equalTo: postCellView.topAnchor, constant: 20),
            postCellImage.leadingAnchor.constraint(equalTo: postCellView.leadingAnchor, constant: 20),
            postCellImage.trailingAnchor.constraint(equalTo: postCellView.trailingAnchor, constant: -20),
            
            postCellHeader.topAnchor.constraint(equalTo: postCellImage.bottomAnchor, constant: 20),
            postCellHeader.leadingAnchor.constraint(equalTo: postCellView.leadingAnchor, constant: 20),
            postCellHeader.trailingAnchor.constraint(equalTo: postCellView.trailingAnchor, constant: -20),
            
            postCellDescription.topAnchor.constraint(equalTo: postCellHeader.bottomAnchor, constant: 12),
            postCellDescription.leadingAnchor.constraint(equalTo: postCellView.leadingAnchor, constant: 20),
            postCellDescription.trailingAnchor.constraint(equalTo: postCellView.trailingAnchor, constant: -20),
            
            postCellBtn.topAnchor.constraint(equalTo: postCellDescription.bottomAnchor, constant: 25),
            postCellBtn.leadingAnchor.constraint(equalTo: postCellView.leadingAnchor, constant: 20),
            postCellBtn.trailingAnchor.constraint(equalTo: postCellView.trailingAnchor, constant: -20),
            
            postCellBtn.bottomAnchor.constraint(equalTo: postCellView.bottomAnchor, constant: -40) // Последний элемент на Вьюхе ВСЕГДА! определяет его высоту
        ])
    }
    
}
