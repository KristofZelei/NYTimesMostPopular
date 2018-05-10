//
//  DashboardConfigurator.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation
import UIKit

class DashboardConfigurator: BaseConfigurator {

    class func configureDashboardScreen(viewController: DashboardViewController) {
        let dashboardInteractor: DashboardInteractorProtocol = getDashboardInteractor()
        let presenter = DashboardPresenter()
        presenter.viewController = viewController
        viewController.interactor = dashboardInteractor as BaseInteractorProtocol
        dashboardInteractor.registerPresenter(presenter)
    }

    class private func getDashboardInteractor() -> DashboardInteractorProtocol! {
        let dashboardInteractor: DashboardInteractorProtocol
        let communicationService = CommunicationService()

        dashboardInteractor = DashboardInteractor(communicationService: communicationService)

        return dashboardInteractor
    }

}
