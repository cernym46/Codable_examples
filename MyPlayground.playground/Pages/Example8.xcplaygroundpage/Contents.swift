import Foundation
import CoreLocation


struct Itm: Codable {
    var gps: CLLocationCoordinate2D
}

extension CLLocationCoordinate2D: Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(longitude)
        try container.encode(latitude)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let gps = try container.decode(String.self)
        let gpsArr = gps.split(separator: ",")
        self.init()
        latitude = Double(gpsArr[0]) ?? 0
        longitude = Double(gpsArr[1]) ?? 0
    }
    
}


do {
    let _ = try JSONDecoder().decode(Itm.self, from: string4.data(using: String.Encoding.utf8)!)
    print("Success")
} catch {
    print("Parsing failed")
}
