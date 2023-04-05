//
//  MainViewController.swift
//  Super easy dev
//
//  Created by Vladimir on 04.04.2023
//

import UIKit

protocol MainViewProtocol: AnyObject {
}

class MainViewController: UIViewController {
    // MARK: - Public
    var presenter: MainPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension MainViewController {
    func initialize() {
    }
}

// MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
}
