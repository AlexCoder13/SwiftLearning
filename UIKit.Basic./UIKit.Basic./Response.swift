//
//  Response.swift
//  UIKit.Basic.
//
//  Created by Александр Семёнов on 02.05.2025.
//

import Foundation

struct Response: Decodable {
    
    let urls: ImageUrls
    
}

struct ImageUrls: Decodable {
    let regular: String
    let full: String
}
