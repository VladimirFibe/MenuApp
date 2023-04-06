import Foundation

final class CategoriesService {
    func getDate(completion: @escaping ([String]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(["Main course", "Side dish", "Dessert", "Salad", "Bread", "Marinade", "Fingerfood", "Snack", "Drink"])
        }
    }
}
