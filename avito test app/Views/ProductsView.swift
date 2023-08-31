//
//  ProductsView.swift
//  avito test app
//
//  Created by stargaltion on 8/30/23.
//

import UIKit

final class ProductsView: UIView, ProductsViewProtocol {

    weak var delegate: ProductsViewControllerDelegate?
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
        return collectionView
    }()
    
    func setupConstraints() {
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    func setup() {
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        collectionView.backgroundColor = .white
    }
    
    func didLoad() {
        setupConstraints()
        setup()
    }
    
    func reloadData() {
        DispatchQueue.main.async { [self] in
            self.collectionView.reloadData()
        }
    }
}
