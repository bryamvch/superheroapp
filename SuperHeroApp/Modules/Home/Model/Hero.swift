//
//  Hero.swift
//  SuperHeroApp
//
//  Created by everis on 30/10/21.
//

import Foundation

struct Hero: Codable {
    let id: Int
    let name: String
    let appearance: Appearance
    let images: HeroImage
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case appearance
        case images
    }
}

struct Appearance: Codable {
    let height: String
    let weight: String
    
    enum CodingKeys: String, CodingKey {
        case height
        case weight
    }
    
    init(height: String, weight: String) {
        self.height = height
        self.weight = weight
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let heightArray: [String] = try container.decode([String].self, forKey: .height)
        let height = heightArray[1]
        let weightArray: [String] = try container.decode([String].self, forKey: .weight)
        let weight = weightArray[1]
        self.init(height: height, weight: weight)
    }
}

struct HeroImage: Codable {
    let lg: String
    
    enum CodingKeys: String, CodingKey {
        case lg
    }
}
