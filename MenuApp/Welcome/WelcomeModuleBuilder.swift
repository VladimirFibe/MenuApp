import Foundation

class WelcomeModuleBuilder {
    static func build() -> WelcomeViewController {
        let interactor = WelcomeInteractor()
        let router = WelcomRouter()
        let presenter = WelcomePresenter(router: router, interactor: interactor)
        let viewController = WelcomeViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewControler = viewController
        return viewController
    }
}
