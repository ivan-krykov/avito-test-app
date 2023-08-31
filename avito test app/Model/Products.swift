//
//  Products.swift
//  avito test app
//
//  Created by stargaltion on 8/28/23.
//

import Foundation
import UIKit

struct Products: Codable {
    let advertisements: [Product]
}

struct Product: Codable {
    let id: String
    let title: String
    let price: String
    let location: String
    let image_url: String
    let created_date: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, price, location
        case imageURL = "image_url"
        case createdDate = "created_date"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(price, forKey: .price)
        try container.encode(location, forKey: .location)
        try container.encode(image_url, forKey: .imageURL)
        try container.encode(created_date, forKey: .createdDate)
      }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        price = try container.decode(String.self, forKey: .price)
        location = try container.decode(String.self, forKey: .location)
        image_url = try container.decode(String.self, forKey: .imageURL)
        created_date = try container.decode(String.self, forKey: .createdDate)
    }
}
