//
//  APIModule.swift
//  VIPER Demo
//
//  Created by Adithya hayagreeva on 5/26/20.
//  Copyright © 2020 Emirates NBD. All rights reserved.
//

import Foundation

class APIModule {
    
    public static let shared = APIModule()

    private let baseURL = "https://pixabay.com/api/"
    private let apiKey = "16732474-3bb4cee0edf1b5e383040bfad"
        
    public func fetchImages(completionHandler: @escaping ((ImagesAPIResponse?) -> Void)) {
        let queryItems = [URLQueryItem(name: "key", value: apiKey)]
        guard var urlComponents = URLComponents(string: baseURL) else { fatalError("baseURL issue") }
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else { fatalError("url issue") }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let imagesAPIResponse = try decoder.decode(ImagesAPIResponse.self, from: data)
                    completionHandler(imagesAPIResponse)
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                    completionHandler(nil)
                }
            } else {
                completionHandler(nil)
            }
        }.resume()
    }
    
}
