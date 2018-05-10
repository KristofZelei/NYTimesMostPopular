//
//  BaseInteractorProtocol.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation

@objc protocol BaseInteractorProtocol: class {
    func registerPresenter(_ presenter: BasePresenterProtocol)
    func unregisterPresenter(viewController: BaseViewController)
}
