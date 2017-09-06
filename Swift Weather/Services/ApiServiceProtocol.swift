import Foundation

protocol ApiServiceProtocol {
    typealias WeatherRequestCompletion = (Result<Weather>) -> Void

    func performWeather(lat:Double, long: Double, completion: @escaping WeatherRequestCompletion)
}
