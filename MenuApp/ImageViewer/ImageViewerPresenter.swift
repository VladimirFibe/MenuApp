//
//  ImageViewerPresenter.swift
//  Super easy dev
//
//  Created by Vladimir on 04.04.2023
//

protocol ImageViewerPresenterProtocol: AnyObject {
}

class ImageViewerPresenter {
    weak var view: ImageViewerViewProtocol?
    var router: ImageViewerRouterProtocol
    var interactor: ImageViewerInteractorProtocol

    init(interactor: ImageViewerInteractorProtocol, router: ImageViewerRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ImageViewerPresenter: ImageViewerPresenterProtocol {
}
