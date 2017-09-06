import Foundation
import Marshal

struct WeatherDescription {
    var main: String
    var detail: String
    var icon: String
    var id: Int
}

extension WeatherDescription: Unmarshaling {
    
    init(object: MarshaledObject) throws {
        id = try object.value(for: "id")
        main = try object.value(for: "main")
        detail = try object.value(for: "description")
        icon = try object.value(for: "icon")
    }
}

extension WeatherDescription: Equatable {
    public static func ==(lhs: WeatherDescription, rhs: WeatherDescription) -> Bool {
        return lhs.main == rhs.main
            && lhs.id == rhs.id
            && lhs.icon == rhs.icon
            && lhs.detail == rhs.detail
    }
}
