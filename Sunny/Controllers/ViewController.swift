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
        presentSearchAlertController(withTitle: "Введите название города на английском", message: nil, style: .alert) { [unowned self] city in
           
            self.networkWeatherManager.onCompletion = { [weak self] currentWeather in
                guard let self = self else { return }
                self.updateInterfaceWith(weather: currentWeather)
            }
            
             self.networkWeatherManager.fetchCurrentWeather(forCity: city)
        }
    }
    
    private func updateInterfaceWith(weather: CurrentWeather) {

        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTemperatureLabel.text = weather.feelsLikeTemperatureString
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
}
