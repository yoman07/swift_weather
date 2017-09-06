import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        defaultContainer.storyboardInitCompleted(WeatherDetailViewController.self) { r, c in
            c.apiService = r.resolve(ApiServiceProtocol.self)
        }
        defaultContainer.register(ApiServiceProtocol.self) { resolver in
            
            guard let apiKey = resolver.resolve(String.self,
                                                name: Keys.apiKey.rawValue) else {
                                                    fatalError("No apikey found")
            }
            
            guard let host = resolver.resolve(String.self,
                                              name: Keys.host.rawValue) else {
                                                fatalError("No host found")
            }
            
            return ApiService(
                host: host,
                apiKey: apiKey)
            
        }
        
        defaultContainer.register(String.self, name: Keys.apiKey.rawValue) { _  in
            return "05bc8675dc8e62dd5eb84aed83c9b31b" //TODO: move to plist
        }
        
        defaultContainer.register(String.self, name: Keys.host.rawValue) { _  in
            return "https://api.openweathermap.org/data/2.5/weather?" //TODO: move to plist
        }
    }
}

enum Keys: String {
    case host, apiKey
}
