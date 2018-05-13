//
//  DashboardPresenter.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import UIKit

class DashboardPresenter : BasePresenter, DashboardPresenterProtocol {
    var dashboardViewController: DashboardViewControllerProtocol {
        return viewController as! DashboardViewControllerProtocol
    }

    func presentMostViewedResults(_ results: [Article]) {
        let configurations = results.map { (i) -> MostViewedCellConfiguration in
            let config = MostViewedCellConfiguration()
            config.date = i.published_date
            config.title = i.title
            config.writer = i.byline
            config.article = i
            if let media = i.media, !media.isEmpty, let metaData = media[0].mediaMetadata, !metaData.isEmpty  {
                config.imageUrl = metaData[0].url                
            }
            return config
        }
        dashboardViewController.showMostViewed(configurations)
    }
    
    deinit {
        viewController = nil
    }

}
