import Foundation
import Marshal

struct Place {
    var country: String
    var sunrise: Double
    var sunset: Double
}

extension Place: Unmarshaling {
    init(object: MarshaledObject) throws {
        country = try object.value(for: "country")
        sunrise = try object.value(for: "sunrise")
        sunset = try object.value(for: "sunset")
    }
}
extension Place: Equatable {
    public static func ==(lhs: Place, rhs: Place) -> Bool {
        return lhs.sunrise == rhs.sunrise
            && lhs.sunset == rhs.sunset
            && lhs.country == rhs.country
    }
}
