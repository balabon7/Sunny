//
//  ViewController.swift
//  Sunny
//
//  Created by mac on 18.07.2020.
//  Copyright © 2020 Aleksandr Balabon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    private var networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        presentSearchAlertController(withTitle: "Введите название города на английском", message: nil, style: .alert) { city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city)
            
            self.networkWeatherManager.onCompletion = { currentWeather in
                print(currentWeather.cityName)
            }
        }
    }
    
}

