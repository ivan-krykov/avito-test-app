//
//  DetailsViewProtocol.swift
//  avito test app
//
//  Created by stargaltion on 8/31/23.
//

import UIKit

protocol DetailsViewProtocol: UIView {
    func didLoad(product: Product)
    func setup(product: Product)
    func setupConstraints(product: Product)
    func reloadData()
}
