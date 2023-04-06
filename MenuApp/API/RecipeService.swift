import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

final class RecipeService {
    let apiKey = "a67a5241c34f45429f75c2d8a1858a67"
    let baseURL = "https://api.spoonacular.com/"
    
    func makeRequest<T: Decodable>(
        path: String,
        params: [String: String] = [:]
    ) async throws -> T {
        var queryItems = [URLQueryItem(name: "apiKey", value: apiKey)]
        for (name, value) in params {
            queryItems.append(URLQueryItem(name: name, value: value))
        }
        var components = URLComponents(string: baseURL+path)
        components?.queryItems = queryItems
        guard let url = components?.url else { throw NetworkError.invalidURL }
        print(#function, url)
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.invalidResponse }
        guard let recipeResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.decodingError }
        return recipeResponse
    }
}
