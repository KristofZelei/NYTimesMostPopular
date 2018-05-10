//
//  DetailsPresenter.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 30..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation

class DetailsPresenter: BasePresenter, DetailsPresenterProtocol {

    var detailsViewController: DetailsViewControllerProtocol {
        return viewController as! DetailsViewControllerProtocol
    }    
  
}
