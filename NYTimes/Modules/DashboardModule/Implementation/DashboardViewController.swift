//
//  DashboardViewController.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import UIKit
import SnapKit

class DashboardViewController : BaseViewController, DashboardViewControllerProtocol, UITableViewDelegate, UITableViewDataSource {
    
    var configurations: [MostViewedCellConfiguration]!
    var mostViewedList: UITableView!
    var cellIdentifier = "cellIdentifier"
    var offset: Int
    
    var dashboardInteractor: DashboardInteractorProtocol {
        return interactor as! DashboardInteractorProtocol
    }
    
    // MARK: ctor
    override init() {
        offset = 0
        super.init()
        configurations = [MostViewedCellConfiguration]()
        setupNavigationBar()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func initSubviews() {
        mostViewedList = UITableView()
    }
    
    override func addSubviews() {
        view.addSubview(mostViewedList)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DashboardConfigurator.configureDashboardScreen(viewController: self)
        configureMostViewedList()
        dashboardInteractor.fetchNextBlock(with: offset)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.interactor = nil
    }
    
    // MARK: Methods
    func setupNavigationBar() {
        navigationItem.title = "NY Times Most Popular"
    }
    
    func configureMostViewedList() {
        mostViewedList.translatesAutoresizingMaskIntoConstraints = false
        mostViewedList.dataSource = self
        mostViewedList.delegate = self
        mostViewedList.separatorStyle = .singleLine
        mostViewedList.register(MostViewedCell.self, forCellReuseIdentifier: cellIdentifier)
        mostViewedList.alwaysBounceVertical = true
        mostViewedList.backgroundColor = .white
        mostViewedList.showsVerticalScrollIndicator = false
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configurations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MostViewedCell = mostViewedList.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MostViewedCell
        cell.selectionStyle = .none
        cell.configuration = configurations[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(DetailsViewController(withArticle: configurations[indexPath.row].article!), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 4 == configurations.count {
            offset += 20
            dashboardInteractor.fetchNextBlock(with: offset)
        }
    }
    
    // MARK: ViewControllerProtocol
    func showMostViewed(_ configuration: [MostViewedCellConfiguration]) {
        configurations.append(contentsOf: configuration)
        mostViewedList.reloadData()
        view.setNeedsUpdateConstraints()
    }
    
    // MARK: Constraints
    override func updateViewConstraints() {
        mostViewedList.snp.remakeConstraints { (make) in
            make.top.equalTo((navigationController?.navigationBar.snp.bottom)!)
            make.width.equalTo(view.snp.width)
            make.bottom.equalToSuperview()
        }
        
        super.updateViewConstraints()
    }
}

