//
//  WelcomePresenter.swift
//  MenuApp
//
//  Created by Vladimir on 04.04.2023.
//

import Foundation

protocol WelcomePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoad(date: String?)
    func didLoad(weather: Int?)
    func didTapImageButton()
}

class WelcomePresenter {
    weak var view: WelcomeViewProtocol?
    var router: WelcomeRouterProtocol
    var interactor: WelcomeInteractorProtocol
    
    init(router: WelcomeRouterProtocol,
         interactor: WelcomeInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension WelcomePresenter: WelcomePresenterProtocol {
    func didTapImageButton() {
        let temperature = interactor.temperature
        router.openImage(for: temperature)
    }
    
    func didLoad(date: String?) {
        guard let date = date else { return }
        view?.showDate(date: date)
    }
    
    func didLoad(weather: Int?) {
        guard let weather = weather else { return }
        view?.showWeather(weather: String(weather))
    }
    
    func viewDidLoaded() {
        interactor.loadData()
        interactor.loadWeather()
    }
}
