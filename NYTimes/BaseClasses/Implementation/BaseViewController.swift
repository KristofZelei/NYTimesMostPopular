//
//  BaseViewController.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewControllerProtocol {

    var interactor: BaseInteractorProtocol!

    init() {
        super.init(nibName: nil, bundle: nil)
        initSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initSubviews() {

    }

    func addSubviews() {

    }

    func showTopBar(with text: String) {
      
    }

    override func viewWillAppear(_ animated: Bool) {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        view.backgroundColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
}
