//
//  DetailsViewController.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 30..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class DetailsViewController: BaseViewController, DetailsViewControllerProtocol, WKNavigationDelegate {
    var detailView: WKWebView!
    var activityIndicator: UIActivityIndicatorView!

    var detailsInteractor: DetailsInteractorProtocol {
        return interactor as! DetailsInteractorProtocol
    }

    // MARK: ctor
    init(withURL url: URL) {
        super.init()
        let request = URLRequest(url: url)
        detailView.load(request)
        detailView.backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Overrides
    override func initSubviews() {
        detailView = WKWebView()
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    }

    override func addSubviews() {
        view.addSubview(detailView)
        view.addSubview(activityIndicator)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        DetailsConfigurator.configureDetailsScreen(viewController: self)
        activityIndicator.center = view.center
        detailView.navigationDelegate = self
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }

    // MARK: Constraints
    override func updateViewConstraints() {
        detailView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        super.updateViewConstraints()
    }
}
