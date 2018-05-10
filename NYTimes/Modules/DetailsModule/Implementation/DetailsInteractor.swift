//
//  DetailsInteractor.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 30..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation

class DetailsInteractor: BaseInteractor, DetailsInteractorProtocol {

    func getDetailsPresenter() -> DetailsPresenterProtocol {
        return try! getLastPresenter(byProtocol: DetailsPresenterProtocol.self) as! DetailsPresenterProtocol
    }

}
