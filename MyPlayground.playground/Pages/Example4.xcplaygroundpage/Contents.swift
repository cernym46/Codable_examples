import Foundation

struct Itm: Decodable {
    
    let id: Int
    let name: String
    
}






do {
    let _ = try JSONDecoder().decode([Itm].self, from: string1.data(using: String.Encoding.utf8)!)
    print("Success")
} catch {
    print("Parsing failed")
}
