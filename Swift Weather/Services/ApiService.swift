import Foundation
import Alamofire

final class ApiService: ApiServiceProtocol {
    
    let host: String
    let apiKey: String
    
    init(host: String, apiKey: String) {
        self.host = host
        self.apiKey = apiKey
    }
    
    func performWeather(for latitude:Double, and longitude: Double, completion: @escaping WeatherRequestCompletion) {
        let path = "lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
        let url = "\(host)\(path)"
        
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            
            if let error = response.error {
                completion(.error(error))
                return
            }
            
            guard let result = response.result.value as? [String: Any] else {
                completion(.error(ApiError.networkError))
                return
            }
            
            do {
                let weather: Weather = try result.value(for: "")
                completion(.success(weather))
            } catch {
                completion(.error(error))
            }
        })
    }
    
    enum ApiError: Error {
        case networkError
    }
}
