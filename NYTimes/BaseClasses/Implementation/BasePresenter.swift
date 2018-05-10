//
//  BasePresenter.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation

class BasePresenter: NSObject, BasePresenterProtocol {

    required override init() {

    }

    var viewController: BaseViewController!

    // MARK: BasePresenterProtocol
    func presentElementAddedToCart() {
        viewController.showTopBar(with: "ADDED TO CART")
    }

}
