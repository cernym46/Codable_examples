import Foundation


struct Response: Decodable {
    
    var itms: [Itm]
    
    enum CodingKeys: CodingKey {
        case itms
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        itms = try container.decode([Itm].self, forKey: .itms)
    }
    
}

struct Itm: Decodable {
    
    let id: Int
    
}






do {
    let _ = try JSONDecoder().decode(Response.self, from: string3.data(using: String.Encoding.utf8)!)
    print("Success")
} catch {
    print("Parsing failed")
}
