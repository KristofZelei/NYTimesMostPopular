//
//  MostViewedCell.swift
//  NYTimes
//
//  Created by Zelux on 2018. 04. 28..
//  Copyright © 2018. Zelux. All rights reserved.
//

import UIKit
import AlamofireImage

class MostViewedCell: UITableViewCell {

    var articleImage: UIImageView!
    var title : UILabel!
    var writer : UILabel!
    var dateIcon: UIImageView!
    var dateText: UILabel!
    var nextIcon: UIImageView!
    
    var configuration: MostViewedCellConfiguration! {
        didSet {
            configureImageView()
            configureTitleLabel()
            configureWriterLabel()
            configureDateIcon()
            configureDateText()
            configureNextIcon()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        initSubviews()
        addSubviews()
    }

    // MARK: ctor
    init(configuration: MostViewedCellConfiguration, style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        initSubviews()
        addSubviews()
        self.configuration = configuration
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subview inits
    private func initSubviews() {
        title = UILabel()
        dateIcon = UIImageView()
        articleImage = UIImageView()
        dateText = UILabel()
        writer = UILabel()
        nextIcon = UIImageView()
    }

    private func addSubviews() {
        addSubview(articleImage)
        addSubview(writer)
        addSubview(title)
        addSubview(dateIcon)
        addSubview(dateText)
        addSubview(nextIcon)
    }

    // MARK: Configuration methods
    private func configureImageView() {
        articleImage.translatesAutoresizingMaskIntoConstraints = false
        articleImage.clipsToBounds = true
        articleImage.contentMode = .scaleAspectFill
        articleImage.layer.cornerRadius = 20
        if let imageURL = configuration.imageUrl, let url = URL(string: imageURL) {
            articleImage.af_setImage(withURL: url)
        }
      
        NSLayoutConstraint.activate([
            articleImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            articleImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            articleImage.widthAnchor.constraint(equalToConstant: 40),
            articleImage.heightAnchor.constraint(equalToConstant: 40)
            ])
    }

    private func configureDateIcon() {
        let templateImage = UIImage(named:"CalendarIcon")?.withRenderingMode(.alwaysTemplate)
        dateIcon.contentMode = .scaleAspectFill
        dateIcon.clipsToBounds = true
        dateIcon.translatesAutoresizingMaskIntoConstraints = false
        dateIcon.tintColor = AppConstant.AppGrayTextColor
        dateIcon.image = templateImage
        
        NSLayoutConstraint.activate([
            dateIcon.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.03),
            dateIcon.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.03),
            dateIcon.leadingAnchor.constraint(equalTo: articleImage.trailingAnchor, constant: 10),
            dateIcon.centerYAnchor.constraint(equalTo: writer.centerYAnchor),
            dateIcon.topAnchor.constraint(greaterThanOrEqualTo: centerYAnchor, constant: 20)
            ])
    }
    
    func configureDateText() {
        dateText.translatesAutoresizingMaskIntoConstraints = false
        dateText.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.8)
        dateText.text = configuration.date
        dateText.font = UIFont.systemFont(ofSize: 12.0)
        dateText.textColor = AppConstant.AppGrayTextColor

        NSLayoutConstraint.activate([
            dateText.centerYAnchor.constraint(equalTo: dateIcon.centerYAnchor),
            dateText.widthAnchor.constraint(equalToConstant: 70),
            dateText.leadingAnchor.constraint(equalTo: dateIcon.trailingAnchor, constant: 5)
            ])
    }

    private func configureTitleLabel() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor.black
        title.textAlignment = .left
        title.text = configuration.title
        title.numberOfLines = 2
        title.font = UIFont.systemFont(ofSize: 15.0)

        NSLayoutConstraint.activate([
            title.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.64),
            title.leadingAnchor.constraint(equalTo: articleImage.trailingAnchor, constant: 10),
            title.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 5)
            ])
    }

    private func configureWriterLabel() {
        writer.translatesAutoresizingMaskIntoConstraints = false
        writer.textAlignment = .right
        writer.text = configuration.writer
        writer.lineBreakMode = .byWordWrapping
        writer.numberOfLines = 2
        writer.textColor = AppConstant.AppGrayTextColor
        writer.font = UIFont.systemFont(ofSize: 12.0)

        NSLayoutConstraint.activate([
            writer.leadingAnchor.constraint(equalTo: dateText.trailingAnchor, constant: 0),
            writer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            writer.topAnchor.constraint(equalTo: centerYAnchor, constant: 10)
            ])
    }
    
    private func configureNextIcon() {
        nextIcon.image = UIImage(named:"NextIcon")
        nextIcon.contentMode = .scaleAspectFill
        nextIcon.clipsToBounds = true
        nextIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            nextIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nextIcon.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            nextIcon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
            ])
    }
}
