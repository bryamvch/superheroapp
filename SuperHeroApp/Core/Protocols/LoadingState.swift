//
//  LoadingState.swift
//  SuperHeroApp
//
//  Created by everis on 30/10/21.
//

import UIKit

protocol LoadingState: class {
    var loadingView: LoadingView { get }
    func startLoading()
    func stopLoading()
}

extension LoadingState where Self: UIViewController {

    func startLoading() {
        loadingView.frame.size = CGSize(width: view.bounds.width, height: view.bounds.height)
        view.addSubview(loadingView)

        loadingView.loader.startAnimating()
    }

    func stopLoading() {
        loadingView.loader.stopAnimating()
        loadingView.removeFromSuperview()
    }

}

class LoadingView: UIView {
    lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.style = .gray
        loader.color = .black
        return loader
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        setupActivityControl()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Error - Container Loader")
    }

    fileprivate func setupActivityControl() {
        addSubview(loader)
        loader.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

