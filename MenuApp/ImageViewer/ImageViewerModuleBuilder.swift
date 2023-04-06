import UIKit

class ImageViewerModuleBuilder {
    static func build(temperature: Int) -> ImageViewerViewController {
        let interactor = ImageViewerInteractor(temperature: temperature)
        let router = ImageViewerRouter()
        let presenter = ImageViewerPresenter(interactor: interactor, router: router)
        let viewController = ImageViewerViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
