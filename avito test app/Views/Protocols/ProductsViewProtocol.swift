//
//  ProductsViewProtocol.swift
//  avito test app
//
//  Created by stargaltion on 8/31/23.
//

import UIKit

protocol ProductsViewProtocol: UIView {
    func didLoad()
    func setup()
    func setupConstraints()
    func reloadData()
}
