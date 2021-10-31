//
//  HomeViewModel.swift
//  SuperHeroApp
//
//  Created by everis on 30/10/21.
//

import Foundation

class HomeViewModel {
    fileprivate let provider = HomeProvider()
    
    var heroes: [Hero] = []
    var errorMessage: String = ""
    
    var homeIsFetching: (() -> Void)?
    var hometDidFetch: (() -> Void)?
    
    func fetchHeroes(completion: @escaping ((ViewModelState) -> Void)) {
        homeIsFetching?()
        provider.requestFetchHeroes { (heroes, error) in
            if let error = error {
                self.errorMessage = error.localizedDescription
                completion(.failure)
                return
            }
            self.heroes = heroes
            self.hometDidFetch?()
            completion(.success)
        }
    }
}
