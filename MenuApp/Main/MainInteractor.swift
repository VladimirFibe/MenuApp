//
//  MainInteractor.swift
//  Super easy dev
//
//  Created by Vladimir on 04.04.2023
//

protocol MainInteractorProtocol: AnyObject {
}

class MainInteractor: MainInteractorProtocol {
    weak var presenter: MainPresenterProtocol?
}
