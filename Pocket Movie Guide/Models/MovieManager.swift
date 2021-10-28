//
//  MovieManager.swift
//  Pocket Movie Guide
//
//  Created by Atila Bastos on 22/10/21.
//

import UIKit

struct MovieManager {
    
    let baseURL = "https://api.themoviedb.org/3/search/movie"
    let apiKey = "?api_key=2ed274e82d1de311fc0a884ad7ef3922"
    let language = "&language=pt-BR"
    let urlQuery = "&query="
    
    func getMovieByName(for movieName: String) {
        let urlString = "\(baseURL)\(apiKey)\(language)\(urlQuery)\(movieName)"
        
        // 1. Create URL
        if let url = URL(string: urlString) {
            // 2. Create URL Session
            let session = URLSession(configuration: .default)
            // 3. Give a task to the session
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString)
                }
            }
            // 4. Execute the task
            task.resume()
        }
    }
}
