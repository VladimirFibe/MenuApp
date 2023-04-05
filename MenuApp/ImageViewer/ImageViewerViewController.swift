//
//  ImageViewerViewController.swift
//  Super easy dev
//
//  Created by Vladimir on 04.04.2023
//

import UIKit

protocol ImageViewerViewProtocol: AnyObject {
}

class ImageViewerViewController: UIViewController {
    // MARK: - Public
    var presenter: ImageViewerPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension ImageViewerViewController {
    func initialize() {
    }
}

// MARK: - ImageViewerViewProtocol
extension ImageViewerViewController: ImageViewerViewProtocol {
}
