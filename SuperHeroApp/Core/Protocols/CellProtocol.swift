//
//  CellProtocol.swift
//  SuperHeroApp
//
//  Created by everis on 30/10/21.
//

import UIKit

protocol CellProtocol: class {
    static var identifier: String { get }
}

extension CellProtocol where Self: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension CellProtocol where Self: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
