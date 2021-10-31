//
//  StoryBoarded.swift
//  SuperHeroApp
//
//  Created by everis on 30/10/21.
//

import UIKit

protocol Storyboarded {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var storyboardIdentifier: String { get }
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static var storyboardName: String { return "Main" }
    static var storyboardBundle: Bundle { return .main }
    static var storyboardIdentifier: String { return String(describing: self) }
    
    static func instantiate() -> Self {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
                .instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to instantiate ViewController")
        }
        return viewController
    }
}
