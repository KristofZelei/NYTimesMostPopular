//
//  AddToCartButtonSmall.swift
//  NennosPizza
//
//  Created by Zelux on 2018. 04. 29..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation
import UIKit

class AddToCartButtonSmall: UIButton {

    var cartImage: UIImageView!
    var priceLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 254, green: 204, blue: 64)
        createCartImage()
        self.layer.cornerRadius = 3
        positionLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createCartImage() {
        cartImage = UIImageView()
        let origImage = UIImage(named: "cartButton")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        cartImage.image = tintedImage
        cartImage.tintColor = .white

        cartImage.translatesAutoresizingMaskIntoConstraints = false
        cartImage.clipsToBounds = true
        cartImage.contentMode = .scaleAspectFill
        self.addSubview(cartImage)
        NSLayoutConstraint.activate([
            cartImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            cartImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cartImage.widthAnchor.constraint(equalToConstant: 26),
            cartImage.heightAnchor.constraint(equalToConstant: 26)
            ])
    }

    func positionLabel() {
        priceLabel = UILabel()
        priceLabel.textColor = .white
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            priceLabel.leadingAnchor.constraint(equalTo: cartImage.trailingAnchor, constant: -4),
            priceLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
            ])

    }

    func setPriceLabelText(_ text:String) {
        priceLabel.addText(text, letterSpacing: -0.39)
    }
}
