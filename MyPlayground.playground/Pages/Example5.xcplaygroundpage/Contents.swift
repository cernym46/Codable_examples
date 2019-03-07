import Foundation

struct Itm: Decodable {
    
    let thirdId: Int
    
    enum CodingKeys: String, CodingKey {
        case firstNest
        case secondNest
        case thirdId
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let firstNestContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .firstNest)
        let secondNestContainer = try firstNestContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .secondNest)
        thirdId = try secondNestContainer.decode(Int.self, forKey: .thirdId)
    }
    
}







do {
    let _ = try JSONDecoder().decode(Itm.self, from: string2.data(using: String.Encoding.utf8)!)
    print("Success")
} catch {
    print(error.localizedDescription)
    print("Parsing failed")
}
