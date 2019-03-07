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
    let firstname: String
    let surname: String
    
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case name
        case surname
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _id = try container.decode(Int.self, forKey: ._id)
        firstname = try container.decode(String.self, forKey: .name)
        surname = try container.decode(String.self, forKey: .surname)
    }
    
}






do {
    let _ = try JSONDecoder().decode(Response.self, from: string1.data(using: String.Encoding.utf8)!)
    print("Success")
} catch {
    print("Parsing failed")
}
