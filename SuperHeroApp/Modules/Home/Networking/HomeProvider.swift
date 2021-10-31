//
//  HomeProvider.swift
//  SuperHeroApp
//
//  Created by everis on 30/10/21.
//

import Foundation
import Moya

class HomeProvider {
    fileprivate let provider = MoyaProvider<HeroService>(endpointClosure: { (target: HeroService) -> Endpoint in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
        switch target {
        default:
            let httpHeaderFields = ["Content-Type" : "application/json"]
            return defaultEndpoint.adding(newHTTPHeaderFields: httpHeaderFields)
        }
    })
    
    func requestFetchHeroes(completion: @escaping (([Hero], Error?) -> Void)) {
        provider.request(.fetchSuperheroes, completion: { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let heroes = try decoder.decode([Hero].self, from: response.data)
                    completion(heroes, nil)
                } catch (let error) {
                    completion([], error)
                }
            case .failure(let error):
                completion([], error)
            }
        })
    }
}
