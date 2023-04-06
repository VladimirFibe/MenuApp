import Foundation

final class WeatherService {
    func getWeather(completion: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(Int.random(in: (-30 ... 30)))
        }
    }
}
