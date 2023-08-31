//
//  DetailsView.swift
//  avito test app
//
//  Created by stargaltion on 8/31/23.
//

import UIKit

class DetailsView: UIView, DetailsViewProtocol {
    
    
    
    
    func reloadData() {
        
    }
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    let dateCreationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "likeBlack"), for: .normal)
        return button
    }()
    
    func setupConstraints(product: Product) {
        self.backgroundColor = UIColor(named: "BackgroundDetailController")
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(priceLabel)
        self.addSubview(locationLabel)
        self.addSubview(dateCreationLabel)
        self.addSubview(button)
        
        let margin: CGFloat = 20
        let labelHeight: CGFloat = 30
        let imageViewSize: CGFloat = 350
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: margin*5).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageViewSize).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageViewSize).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: margin).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
        titleLabel.text = product.title
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin*1.5).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        priceLabel.text = product.price
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 0).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin*1.5).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateCreationLabel.translatesAutoresizingMaskIntoConstraints = false
        dateCreationLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 0).isActive = true
        dateCreationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin*1.5).isActive = true
        dateCreationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
        dateCreationLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        dateCreationLabel.text = product.created_date
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin*2).isActive = true
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 150).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setup(product: Product) {
        let image = UIImage(named: "location")
        let attachment = NSTextAttachment()
        let attributedString = NSMutableAttributedString(string: product.location)
        attachment.image = image
        attributedString.insert(NSAttributedString(attachment: attachment), at: 0)
        locationLabel.attributedText = attributedString
        locationLabel.textColor = UIColor(named: "textColorDescription")
        locationLabel.numberOfLines = 1
        locationLabel.font = .systemFont(ofSize: 18, weight: .regular)
        locationLabel.textAlignment = .left
    }
    
    func didLoad(product: Product) {
        setupConstraints(product: product)
        setup(product: product)
    }
}
