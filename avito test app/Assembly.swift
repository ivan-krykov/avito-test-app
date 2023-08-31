//
//  Assembly.swift
//  avito test app
//
//  Created by stargaltion on 8/30/23.
//

import Foundation
import UIKit

struct Assembly {
    func createProductsViewController() -> ProductsViewController {
        let productsView = ProductsView()
        let apiManager = ApiManager()
        
        let controller = ProductsViewController(productsView: productsView, apiManager: apiManager)
        
        productsView.delegate = controller
        
        return controller
    }
    
    func createDetailsViewController(product: Product) -> DetailViewController {
        let detailsView = DetailsView()
        
        let controller = DetailViewController(product: product, detailsView: detailsView)
        
        return controller
    }
}
