//
//  ImageViewerInteractor.swift
//  Super easy dev
//
//  Created by Vladimir on 04.04.2023
//

protocol ImageViewerInteractorProtocol: AnyObject {
}

class ImageViewerInteractor: ImageViewerInteractorProtocol {
    weak var presenter: ImageViewerPresenterProtocol?
}
