//
//  BaseConfigurator.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation
import UIKit

class BaseConfigurator: NSObject {

    class private func getAppDelegate() -> AppDelegate {

        if Thread.isMainThread {
            return UIApplication.shared.delegate! as! AppDelegate
        } else {
            var appdelegate: AppDelegate!

            DispatchQueue.main.sync {
                appdelegate = UIApplication.shared.delegate! as! AppDelegate
            }

            return appdelegate!
        }

    }
}
