//
//  ViewController.swift
//  spaceWeather
//
//  Created by Mmako Sekhosana on 2023/06/12.
//

import UIKit

class HomeViewController: UIViewController {
    private var weather: WeatherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    private func getWeather() {
        WeatherDataSource.fetchWeather { result in
            switch result {
            case .success(let weatherData):
                self.weather = weatherData
                DispatchQueue.main.async {
                    self.showDisplayWeatherAlert(weather: self.weather)
                }
            case .failure(_):
                self.weather = nil
            }
        }
    }
    
    private func showDisplayWeatherAlert(weather: WeatherModel?) {
        let alertController = UIAlertController(title: "Get weather", message: "Tap OK to continue", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .default) { [weak self] (_) in
            guard let self = self else { return }
            
            if let weather = weather {
                let weatherModel = DisplayWeatherViewModel(with: weather)
                let viewController = DisplayWeatherTableViewController(viewModel: weatherModel)
                viewController.navigationController?.navigationBar.isHidden = true
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true, completion: nil)
            }
        }
        
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
}
