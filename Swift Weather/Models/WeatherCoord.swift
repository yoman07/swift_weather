import Foundation
import Marshal

struct WeatherCoord {
    var lon: Double
    var lat: Double
}

extension WeatherCoord: Unmarshaling {
    init(object: MarshaledObject) throws {
        lon = try object.value(for: "lon")
        lat = try object.value(for: "lat")
    }
}
extension WeatherCoord: Equatable {
    public static func ==(lhs: WeatherCoord, rhs: WeatherCoord) -> Bool {
        return lhs.lon == rhs.lon
            && lhs.lat == rhs.lat
    }
}
