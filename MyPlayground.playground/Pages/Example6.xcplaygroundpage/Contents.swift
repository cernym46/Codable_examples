import Foundation


struct Response: Decodable {
    
    var itms: [Itm]
    
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
