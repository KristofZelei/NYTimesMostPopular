//
//  DetailsViewController.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 30..
//  Copyright © 2018. Zelux. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: BaseViewController, DetailsViewControllerProtocol {
    var article: Article!
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    var articleTypeLabel: UILabel!
    var imageView: UIImageView!
    var dateLabel: UILabel!
    var titleLabel: UILabel!
    var detailLabel: UILabel!
    var authorLabel: UILabel!
    var safariButton: UIButton!
    var footerStackView: UIStackView!
    var footerLogoImageView: UIImageView!
    var copyrightLabel: UILabel!
    
    
    var detailsInteractor: DetailsInteractorProtocol {
        return interactor as! DetailsInteractorProtocol
    }
    
    // MARK: ctor
    init(withArticle article: Article) {
        super.init()
        self.article = article
        navigationItem.title = "Article details"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionButtonTapped(sender:)))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func initSubviews() {
        scrollView = UIScrollView()
        stackView = UIStackView()
        articleTypeLabel = UILabel()
        imageView = UIImageView(image: UIImage(named: "PlaceHolderImage_Detail"))
        dateLabel = UILabel()
        titleLabel = UILabel()
        detailLabel = UILabel()
        authorLabel = UILabel()
        safariButton = UIButton(type: .system)
        footerStackView = UIStackView()
        footerLogoImageView = UIImageView(image: UIImage(named: "NYT_footer_logo"))
        copyrightLabel = UILabel()
    }
    
    override func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(articleTypeLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(safariButton)
        stackView.addArrangedSubview(footerStackView)
        footerStackView.addArrangedSubview(footerLogoImageView)
        footerStackView.addArrangedSubview(copyrightLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailsConfigurator.configureDetailsScreen(viewController: self)
        
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.spacing = 7.0;
        stackView.axis = .vertical;
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        
        articleTypeLabel.font = UIFont.systemFont(ofSize: 12)
        articleTypeLabel.text = article.type?.uppercased()
        
        imageView.contentMode = .scaleAspectFit
        if let media = article.media, !media.isEmpty, let metaData = media[0].mediaMetadata, !metaData.isEmpty  {
            if let imageURL = metaData[0].url, let url = URL(string: imageURL) {
                imageView.af_setImage(withURL: url)
            }
        }
        
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.text = article.published_date
        dateLabel.textColor = AppConstant.AppDarkGrayColor
        
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Cheltenham", size: 20)
        titleLabel.text = article.title
        
        detailLabel.numberOfLines = 0
        detailLabel.textColor = AppConstant.AppDarkGrayColor
        detailLabel.text = article.abstract
        detailLabel.font = UIFont(name: "Georgia", size: 14)
        
        if let author = article.byline, !author.isEmpty {
            authorLabel.text = author
            authorLabel.font = UIFont.systemFont(ofSize: 12)
            authorLabel.textColor = AppConstant.AppDarkGrayColor
        }
        
        safariButton.titleLabel?.font = UIFont(name: "Georgia", size: 14)
        safariButton.setTitle("Click here for full article", for: .normal)
        safariButton.addTarget(self, action: #selector(linkToFullArticlePressed(sender:)), for: .touchUpInside)
        
        footerStackView.alignment = .center
        footerStackView.axis = .vertical
        footerStackView.spacing = 3.0
        
        footerLogoImageView.contentMode = .center
        
        copyrightLabel.textColor = AppConstant.AppDarkGrayColor
        copyrightLabel.font = UIFont(name: "Georgia", size: 14)
        copyrightLabel.text = "Copyright"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isMovingFromParentViewController {
            self.interactor = nil
        }
    }
    
    // MARK: Constraints
    override func updateViewConstraints() {
        scrollView.snp.remakeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        stackView.snp.remakeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview().offset(6)
            make.bottom.equalToSuperview().offset(-12)
            make.centerX.equalToSuperview()
        }
        
        imageView.snp.remakeConstraints { (make) in
            make.width.equalToSuperview()
        }
        
        super.updateViewConstraints()
    }
    
    @objc func linkToFullArticlePressed(sender: UIButton) {
        if let url = URL(string: article.url!), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }
    
    @objc func actionButtonTapped(sender: UIBarButtonItem) {
        if let url = article.url {
            let activityController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            activityController.popoverPresentationController?.barButtonItem = sender
            activityController.popoverPresentationController?.permittedArrowDirections = .up
            present(activityController, animated: true, completion: nil)
        }
    }
}

