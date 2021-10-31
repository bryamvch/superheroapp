//
//  HomeCollectionViewCell.swift
//  SuperHeroApp
//
//  Created by everis on 30/10/21.
//

import UIKit
import SDWebImage

class HomeCollectionViewCell: UICollectionViewCell, CellProtocol {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        heroImageView.image = UIImage()
        heroNameLabel.text = ""
        heroWeightLabel.text = ""
        heroHeightLabel.text = ""
    }
    
    var heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var heroNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        return label
    }()
    
    var heroHeightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var heroWeightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
}

extension HomeCollectionViewCell {
    func setupCell(for hero: Hero) {
        heroImageView.sd_setImage(with: URL(string: hero.images.lg))
        heroNameLabel.text = hero.name
        heroHeightLabel.text = "Height \(hero.appearance.height)"
        heroWeightLabel.text = "Weight \(hero.appearance.weight)"
    }
    
    func setupConstraints() {
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
        
        backgroundColor = .gray
        addSubview(heroImageView)
        heroImageView.contentMode = .scaleAspectFill
        heroImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        heroImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        heroImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        heroImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(heroWeightLabel)
        heroWeightLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        heroWeightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        heroWeightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        addSubview(heroHeightLabel)
        heroHeightLabel.bottomAnchor.constraint(equalTo: heroWeightLabel.topAnchor, constant: -2).isActive = true
        heroHeightLabel.leadingAnchor.constraint(equalTo: heroWeightLabel.leadingAnchor).isActive = true
        heroHeightLabel.trailingAnchor.constraint(equalTo: heroWeightLabel.trailingAnchor).isActive = true
        
        addSubview(heroNameLabel)
        heroNameLabel.bottomAnchor.constraint(equalTo: heroHeightLabel.topAnchor, constant: -2).isActive = true
        heroNameLabel.leadingAnchor.constraint(equalTo: heroWeightLabel.leadingAnchor).isActive = true
        heroNameLabel.trailingAnchor.constraint(equalTo: heroWeightLabel.trailingAnchor).isActive = true
    }
}
