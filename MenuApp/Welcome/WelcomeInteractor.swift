//
//  WelcomeInteractor.swift
//  MenuApp
//
//  Created by Vladimir on 04.04.2023.
//

import Foundation

protocol WelcomeInteractorProtocol: AnyObject {
    func loadData()
    func loadWeather()
    var temperature: Int { get }
}

class WelcomeInteractor: WelcomeInteractorProtocol {
    var temperature: Int = 0
    
    weak var presenter: WelcomePresenterProtocol?
    let dateService = DateService()
    let weatherService = WeatherService()
    
    func loadData() {
        dateService.getDate {[weak self] date in
            self?.presenter?.didLoad(date: date.description)
        }
    }
    
    func loadWeather() {
        weatherService.getWeather {[weak self] weather in
            self?.presenter?.didLoad(weather: weather)
            self?.temperature = weather
        }
    }
}
