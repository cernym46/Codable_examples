import Foundation


struct Response: Decodable {
    
    var itms: [Itm]
    
    init(from decoder: Decoder) throws {
        let containerMaster = try decoder.singleValueContainer()
        itms = try containerMaster.decode([Itm].self)
    }
    
}

struct Itm: Decodable {
    
    let _id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case name
    }
    
}






do {
    let _ = try JSONDecoder().decode(Response.self, from: data1)
    print("Success")
} catch {
    print("Parsing failed")
}
