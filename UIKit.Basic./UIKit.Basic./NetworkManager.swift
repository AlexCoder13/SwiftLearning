//
//  NetworkManager.swift
//  UIKit.Basic.
//
//  Created by Александр Семёнов on 02.05.2025.
//

/*
 Что нам нужно:
 1 - URL, куда мы будем отправлять запрос
 2 - Ключ доступа (API-ключ)
 3 - Дополнительные параметры в рамках выбранного API
 */

import UIKit

class NetworkManager {
    
    // client_id - ключ, потом пригодится
    // /photos/random - путь
    
    // АПИ-ключ
    let apiKey: String = "07FpKKAujVbfHV2cXmDuXAYiFm6sLRjlur5MGexPNBg"
    // URL - куда отправлять запросы
    let url: String = "https://api.unsplash.com"
    
    func sendRequest() {
        
    }
    
}
