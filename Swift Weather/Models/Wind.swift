import Foundation
import Marshal

struct Wind {
    var speed: Double
    var deg: Double
}

extension Wind: Unmarshaling {
    init(object: MarshaledObject) throws {
        speed = try object.value(for: "speed")
        deg = try object.value(for: "deg")
    }
}
extension Wind: Equatable {
    public static func ==(lhs: Wind, rhs: Wind) -> Bool {
        return lhs.speed == rhs.speed
            && lhs.deg == rhs.deg
    }
    
}
