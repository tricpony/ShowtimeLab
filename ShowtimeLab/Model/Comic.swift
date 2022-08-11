//
//  Comic.swift
//  ShowtimeLab
//
//  Created by aarthur on 8/10/22.
//

import Foundation

struct Comic: Codable {
    let title: String
    let alt: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title = "safe_title"
        case alt
        case imageUrl = "img"
    }
}
