//
//  PostDetailsViewModel.swift
//  TableView-API
//
//  Created by Dhathri Bathini on 9/5/25.
//

import Foundation

class PostDetailsViewModel {
    
    var postsList: [PostDetails] = []
    var networkManager = NetworkManager.shared
    
    func getNumberOfRows() -> Int {
        return postsList.count
    }
    
    func getPostDetails(at index: Int) -> PostDetails {
        return postsList[index]
    }
    
    func getDataFromServer(completion: (() -> Void)? = nil) {
        networkManager.getData(from: Server.endPoint.rawValue) { [weak self] fetchedList in
            guard let self = self else { return }
            self.postsList = fetchedList
            DispatchQueue.main.async {
                completion?()
            }
        }
    }
}
