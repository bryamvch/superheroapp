//
//  HeroProvider.swift
//  SuperHeroApp
//
//  Created by everis on 30/10/21.
//

import Foundation
import Moya

enum HeroService {
    case fetchSuperheroes
}

extension HeroService: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://dev.consultr.net") else {
            fatalError("URL cannot be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchSuperheroes:
            return "/superhero.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchSuperheroes:
            return .get
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
