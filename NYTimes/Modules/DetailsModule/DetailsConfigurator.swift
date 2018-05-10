//
//  DetailsConfigurator.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 30..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation

class DetailsConfigurator: BaseConfigurator {
    class func configureDetailsScreen(viewController: DetailsViewController) {
        let detailsInteractor: DetailsInteractorProtocol = getDetailsInteractor()
        let presenter = DetailsPresenter()
        presenter.viewController = viewController
        viewController.interactor = detailsInteractor as BaseInteractorProtocol
        detailsInteractor.registerPresenter(presenter)
    }

    class private func getDetailsInteractor() -> DetailsInteractorProtocol! {
        return DetailsInteractor()
    }
}
