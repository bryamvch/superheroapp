//
//  ViewController.swift
//  SuperHeroApp
//
//  Created by everis on 30/10/21.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded, LoadingState {
    
    var loadingView = LoadingView()
    var viewModel = HomeViewModel()

    @IBOutlet weak var heroesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewModel()
        fetchHeroes()
    }

}

extension HomeViewController {
    func fetchHeroes() {
        viewModel.fetchHeroes(completion: { [weak self] state in
            switch state {
            case .success:
                self?.stopLoading()
                self?.heroesCollectionView.reloadData()
            case .failure:
                self?.stopLoading()
            }
        })
    }
    
    func setupView() {
        heroesCollectionView.delegate = self
        heroesCollectionView.dataSource = self
    }
    
    func setupViewModel() {
        viewModel.homeIsFetching = { [weak self] in
            self?.startLoading()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  30
        let collectionViewSize = view.bounds.size.width - padding
        return CGSize(width: collectionViewSize/2, height: 300)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
                        .dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier,
                                             for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupCell(for: viewModel.heroes[indexPath.row])
        cell.setupConstraints()
        return cell
    }
}

