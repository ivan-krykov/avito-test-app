//
//  ProductsViewControllerProtocol.swift
//  avito test app
//
//  Created by stargaltion on 8/30/23.
//

import Foundation
import UIKit

protocol ProductsViewControllerDelegate: AnyObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func loadData()
    
    func openDetailVC(product: Product, image: UIImage)
}
