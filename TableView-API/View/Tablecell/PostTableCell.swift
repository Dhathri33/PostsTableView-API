//
//  PostTableCell.swift
//  TableView-API
//
//  Created by Dhathri Bathini on 9/5/25.
//

import UIKit

class PostTableCell: UITableViewCell {
    
    //MARK: Properties
    
    static let reuseIdentifier = "PostTableCell"
    let titleLabel = UILabel()
    let postDetailsLabel = UILabel()
    
    //MARK: Initializers for UITableViewCell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Helper functions

extension PostTableCell {
    func setupUI() {
        backgroundColor = .white
        
        titleLabel.font = UIFont(name: "TimesNewRomanPSMT", size: 20)
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 0
        
        postDetailsLabel.font = UIFont(name: "TimesNewRomanPSMT", size: 17)
        postDetailsLabel.textColor = .secondaryLabel
        postDetailsLabel.numberOfLines = 0
        
        let vStack = UIStackView(arrangedSubviews: [titleLabel, postDetailsLabel])
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.setCustomSpacing(10, after: titleLabel)
        contentView.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
    }
    
    func loadCellData(post: PostDetails){
        titleLabel.text = post.title
        postDetailsLabel.text = post.body
    }
}
