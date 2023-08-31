//
//  ViewController.swift
//  avito test app
//
//  Created by stargaltion on 8/27/23.
//

import UIKit

class ProductsViewController: UIViewController, ProductsViewControllerDelegate {
    
    
    var productsView: ProductsView
    var apiManager: ApiManager
    
    func loadData() {
        apiManager.loadProducts(){ response in
            self.loadImages(products: response)
        }

    }
    
    func loadImages(products: [Product]) {
        if self.products.isEmpty {
            self.products = products
            for product in self.products {
                self.apiManager.loadImage(from: product.image_url) { image in
                    self.productImages[product.id] = image
                }
            }
        }
    }
    
    func openDetailVC(product: Product, image: UIImage) {
        let vc = Assembly().createDetailsViewController(product: product)
        vc.detailsView.imageView.image = image
        navigationController?.pushViewController(vc, animated: true)
    }
    
    init(productsView: ProductsView, apiManager: ApiManager) {
        self.productsView = productsView
        self.apiManager = apiManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var products = [Product]()
    
    private var productImages = [String : UIImage]() {
        didSet {
            productsView.reloadData()
        }
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        let backBarButtonItem = UIBarButtonItem(title: "К товарам", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    override func loadView() {
         view = productsView
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            loadData()
            productsView.didLoad()
        }
    }

    extension ProductsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return products.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
            cell.activityIndicatorView.startAnimating()
            let product = products[indexPath.row]
            cell.setup(with: product, image: productImages[product.id] ?? UIImage())
            
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (collectionView.bounds.width - 30) / 2
            let height = width*1.3
            return CGSize(width: width, height: height)
        }
    }

extension ProductsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let product = products[indexPath.item]
            let selectedCell = collectionView.cellForItem(at: indexPath) as! ProductCell
            openDetailVC(product: product, image: selectedCell.imageView.image ?? UIImage())
    }
}

