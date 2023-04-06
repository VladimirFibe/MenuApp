import UIKit

protocol MainPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoad(categories: [String]?)
    func didLoad(recipies: [Recipe]?)
}

class MainPresenter {
    weak var view: MainViewProtocol?
    var router: MainRouterProtocol
    var interactor: MainInteractorProtocol

    init(interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MainPresenter: MainPresenterProtocol {
    func didLoad(categories: [String]?) {
        guard let categories = categories else { return }
        view?.showCategories(categories)
    }
    
    func didLoad(recipies: [Recipe]?) {
        guard let recipies = recipies else { return }
        view?.showRecipies(recipies)
    }
    
    func viewDidLoaded() {
        interactor.loadCategories()
        interactor.loadRecipes()
    }
    
}
