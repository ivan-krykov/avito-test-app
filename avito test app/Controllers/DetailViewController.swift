//
//  DetailController.swift
//  avito test app
//
//  Created by stargaltion on 8/29/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    let product: Product
    var detailsView: DetailsView
    var liked = false
    
    init(product: Product, detailsView: DetailsView) {
        self.product = product
        self.detailsView = detailsView
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsView.button.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
        detailsView.didLoad(product: product)
    }
    
    override func loadView() {
         view = detailsView
    }
    
    @objc func addFavorite() {
        liked.toggle()
        if liked {
            detailsView.button.setImage(UIImage(named: "likeRed"), for: .normal)
        } else {
            detailsView.button.setImage(UIImage(named: "likeBlack"), for: .normal)
        }
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
