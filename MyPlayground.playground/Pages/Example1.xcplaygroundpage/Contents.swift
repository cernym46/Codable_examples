import Foundation


struct Response: Decodable {
    
    var itms: [Itm]
    
    init(from decoder: Decoder) throws {
        let containerMaster = try decoder.singleValueContainer()
        itms = try containerMaster.decode([Itm].self)
    }
    
}

struct Itm: Decodable {
    
    let id: Int
    let name: String
    
}






do {
    let _ = try JSONDecoder().decode(Response.self, from: string1.data(using: String.Encoding.utf8)!)
    print("Success")
} catch {
    print("Parsing failed")
}
