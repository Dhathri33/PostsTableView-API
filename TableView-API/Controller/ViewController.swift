//
//  ViewController.swift
//  TableView-API
//
//  Created by Dhathri Bathini on 9/5/25.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    
    var postsList: [PostDetails] = []
    let tableView = UITableView()
    let titleLabel = UILabel()
    var networkManager = NetworkManager.shared
    
    //MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupUI()
        getDataFromServer()
        
    }
}

//MARK: TableView DataSource Methods

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableCell.reuseIdentifier, for: indexPath) as? PostTableCell else {
            return UITableViewCell()
        }
        cell.loadCellData(post: postsList[indexPath.row])
        return cell
    }
}

//MARK: Helper functions

extension ViewController {
    
    func setupUI() {
        
        view.backgroundColor = .white
        
        titleLabel.text = "Posts"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 35)
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.register(PostTableCell.self, forCellReuseIdentifier: PostTableCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 130
        
        let vStack = UIStackView(arrangedSubviews: [titleLabel, tableView])
        vStack.axis = .vertical
        vStack.spacing = 20
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableView.heightAnchor.constraint(equalToConstant: 680),
            tableView.widthAnchor.constraint(equalToConstant: 393)
        ])
    }
    
    func setupDelegates() {
        tableView.dataSource = self
    }
        
    func getDataFromServer(completion: (() -> Void)? = nil) {
        networkManager.getData(from: Server.endPoint.rawValue) { [weak self] fetchedList in
            guard let self = self else { return }
            self.postsList = fetchedList
            DispatchQueue.main.async {
                self.tableView.reloadData()
                completion?()
            }
        }
    }
}




