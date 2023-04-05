//
//  ImageViewerModuleBuilder.swift
//  Super easy dev
//
//  Created by Vladimir on 04.04.2023
//

import UIKit

class ImageViewerModuleBuilder {
    static func build() -> ImageViewerViewController {
        let interactor = ImageViewerInteractor()
        let router = ImageViewerRouter()
        let presenter = ImageViewerPresenter(interactor: interactor, router: router)
        let storyboard = UIStoryboard(name: "ImageViewer", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ImageViewer") as! ImageViewerViewController
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
