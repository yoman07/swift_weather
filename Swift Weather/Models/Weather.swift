import Foundation
import Marshal

struct Weather: Unmarshaling {
    var weatherDescription: [WeatherDescription]
    var name: String
    var coord: WeatherCoord
    var details: WeatherDetails
    var wind: Wind
    var place: Place
    
    init(object: MarshaledObject) throws {
        weatherDescription = try object.value(for: "weather")
        name = try object.value(for: "name")
        coord = try object.value(for: "coord")
        details = try object.value(for: "main")
        wind = try object.value(for: "wind")
        place = try object.value(for: "sys")
    }
}









