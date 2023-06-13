//
//  WeatherDataSource.swift
//  spaceWeather
//
//  Created by Mmako Sekhosana on 2023/06/12.
//

import Foundation

class WeatherDataSource {
    static func fetchWeather(completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        let urlString = Config.WEATHERURL
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            
            DispatchQueue.global().async {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let weatherData = try decoder.decode(WeatherModel.self, from: data)
                    
                    
                    DispatchQueue.main.async {
                        completion(.success(weatherData))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
}
