//
//  IngredientTableViewCell.swift
//  NennosPizza
//
//  Created by Zelux on 2018. 04. 29..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

enum  ProductTableViewCellStyle {
    case selectable
    case deletable
    case addable
}

class ProductTableViewCell: UITableViewCell {

    var product: Product!
    var needLeftImage: Bool!
    var priceText: UILabel!
    var productName: UILabel!
    var leftImage: UIImageView!
    private var _productStyle: ProductTableViewCellStyle!

    // MARK: ctor
    init(style: UITableViewCellStyle, reuseIdentifier: String?, productStyle: ProductTableViewCellStyle) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }

    init(configuration: ProductTableViewCellConfiguration, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        product = configuration.product
        needLeftImage = configuration.isSelected
        _productStyle = configuration.productStyle

        configureCell()
        initSubviews()
        addSubviews()

        configureLeftImage()
        configureProductName()
        configurePriceTextField()
    }

    init(product: Product, style: UITableViewCellStyle, reuseIdentifier: String?, productStyle: ProductTableViewCellStyle) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.product = product
        needLeftImage = false
        _productStyle = productStyle

        configureCell()
        initSubviews()
        addSubviews()

        configureLeftImage()
        configureProductName()
        configurePriceTextField()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subview inits
    private func initSubviews() {
        priceText = UILabel()
        productName = UILabel()
        leftImage = UIImageView()
    }

    private func addSubviews() {
        addSubview(priceText)
        addSubview(productName)
        addSubview(leftImage)
    }

    // MARK: Configuration
    private func configureCell() {
        self.backgroundColor = .white
        self.preservesSuperviewLayoutMargins = false
        self.contentView.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets(top: 0, left: 31, bottom: 0, right: 0)
        self.layoutMargins = UIEdgeInsets.zero
    }

    private func configurePriceTextField() {
        priceText.text = product.price.cleanValueWithCurrency
        priceText.font = UIFont.systemFont(ofSize: 17)
        priceText.textColor = AppConstant.AppDefaultTextColor
        priceText.textAlignment = .right
        priceText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceText.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            priceText.heightAnchor.constraint(equalTo: heightAnchor),
            priceText.centerYAnchor.constraint(equalTo: centerYAnchor),
            priceText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
            ])
    }

    private func configureProductName() {
        productName.addText(product.name, letterSpacing: -0.41)
        productName.font = UIFont.systemFont(ofSize: 17)
        productName.textColor = AppConstant.AppDefaultTextColor
        productName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productName.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),
            productName.heightAnchor.constraint(equalTo: heightAnchor),
            productName.centerYAnchor.constraint(equalTo: centerYAnchor),
            productName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 31)
            ])
    }

    private func configureLeftImage() {

        setLeftImage()
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        leftImage.isHidden = !needLeftImage

        var heightConstant: CGFloat = 0.0
        var widthConstant: CGFloat = 0.0
        switch _productStyle {
        case .selectable:
            heightConstant = 10
            widthConstant = 13
        case .deletable:
            heightConstant = 8.5
            widthConstant = 8.5
        case .addable:
            heightConstant = 11
            widthConstant = 11
        case .none: break

        case .some(_): break

        }

        NSLayoutConstraint.activate([
            leftImage.widthAnchor.constraint(equalToConstant: widthConstant),
            leftImage.heightAnchor.constraint(equalToConstant: heightConstant),
            leftImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3)
            ])
    }

    private func setLeftImage() {
        var imageName = ""
        switch _productStyle {
        case .selectable:
            imageName = "checkmark"
        case .deletable:
            imageName = "deleteIcon"
        case .addable:
            imageName = "plusIcon"
        case .none: break

        case .some(_): break

        }
        leftImage.image = UIImage(named: imageName)
    }

    private func updateLeftImageView() {
        setLeftImage()
        configureLeftImage()
    }

    // MARK: Methods
    func changeIsUsed(to newValue: Bool) {
        needLeftImage = newValue
        if newValue {
          leftImage.isHidden = false
        } else {
           leftImage.isHidden = true
        }
    }

}
