//
//  CurrentWeather.swift
//  Sunny
//
//  Created by mac on 20.07.2020.
//  Copyright © 2020 Aleksandr Balabon. All rights reserved.
//

import Foundation

struct CurrentWeather {
    
    let cityName: String
    let temperature: Double
    var temperatureString: String {
        return "\(temperature.rounded())"
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
          return "\(feelsLikeTemperature.rounded())"
      }
    let conditionCode: Int
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
