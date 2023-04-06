protocol MainInteractorProtocol: AnyObject {
    func loadRecipes()
    func loadCategories()
}

class MainInteractor: MainInteractorProtocol {
    weak var presenter: MainPresenterProtocol?
    let categoriesService = CategoriesService()
    let recipeService = RecipeService()
    func loadCategories() {
        categoriesService.getDate {[weak self] categories in
            self?.presenter?.didLoad(categories: categories)
        }
    }
    
    func loadRecipes() {
        Task {
            do {
                let response: RecipeResponse = try await recipeService.makeRequest(
                    path: "recipes/random",
                    params: ["number": "10"])
                self.presenter?.didLoad(recipies: response.recipes)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
