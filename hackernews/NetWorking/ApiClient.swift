//
//  ApiClient.swift
//  hackernews
//
//  Created by Luis Gutierrez on 29/04/24.
//


import Foundation

class ApiClient {
    func getNews(completion: @escaping (Result<News, Error>) -> Void) {
        
        var request = URLRequest(url: URL(string: "http://hn.algolia.com/api/v1/search_by_date?query=androi%20d")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let _: Void = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                } else {
                    print("No data received")
                }
                return
            }
            
            print(String(data: data, encoding: .utf8)!)
            
            do {
                let result = try JSONDecoder().decode(News.self, from: data)
                
                completion(.success(result))
                
            } catch {
                print("Error decoding JSON: \(error)")
                completion(.failure(error))

            }
        }.resume()
    }
}
