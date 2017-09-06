import Foundation
import Marshal

struct WeatherDetails {
    var temp: Double
    var pressure: Double?
    var humidity: Double?
    var tempMin: Double?
    var tempMax: Double?
    var seaLevel: Double?
    var groundLevel: Double?
}

extension WeatherDetails: Unmarshaling {
    init(object: MarshaledObject) throws {
        temp = try object.value(for: "temp")
        pressure = try object.value(for: "pressure")
        humidity = try object.value(for: "humidity")
        tempMin = try object.value(for: "temp_min")
        tempMax = try object.value(for: "temp_max")
        seaLevel = try object.value(for: "sea_level")
        groundLevel = try object.value(for: "grnd_level")
    }
}
extension WeatherDetails: Equatable {
    public static func ==(lhs: WeatherDetails, rhs: WeatherDetails) -> Bool {
        return lhs.temp == rhs.temp
            && lhs.pressure == rhs.pressure
            && lhs.pressure == rhs.pressure
            && lhs.tempMin == rhs.tempMin
            && lhs.tempMax == rhs.tempMax
            && lhs.seaLevel == rhs.seaLevel
            && lhs.groundLevel == rhs.groundLevel
    }
    
}
