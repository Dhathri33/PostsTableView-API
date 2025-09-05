//
//  NetworkManager.swift
//  TableView-API
//
//  Created by Dhathri Bathini on 9/5/25.
//
import Foundation

protocol Network {
    func getData(from serverUrl: String, closure: @escaping ([PostDetails]) -> Void)
}

class NetworkManager: Network {
    static let shared = NetworkManager()

    func getData(from serverUrl: String, closure: @escaping ([PostDetails]) -> Void) {

        guard let serverURL = URL(string: serverUrl) else {
            print("Server URL is invalid")
            return
        }
        
       // fetch the data from the server
        let urlSession = URLSession.shared
        urlSession.dataTask(with: URLRequest(url: serverURL)) { data, response, error in
            
            // checking whether error fetchting the api
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            // wrapping the optional data to non optional
            guard let data = data else {
                print("No data returned from the server")
                return
            }
            
            // parsing the data to model
            do {
                let postDetails = try JSONDecoder().decode([PostDetails].self, from: data)
                closure(postDetails)
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }.resume()
    }
}
