//
//  NetworkWeatherManager.swift
//  Sunny
//
//  Created by mac on 18.07.2020.
//  Copyright © 2020 Aleksandr Balabon. All rights reserved.
//

import Foundation

struct NetworkWeatherManager {
    
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
          
                self.parseJSON(withData: data)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) {
        
        let decoder = JSONDecoder()
        
        do {
          let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            
            print(currentWeatherData.main.temp)
            print(currentWeatherData.main.feelsLike)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
}
