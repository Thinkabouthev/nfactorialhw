import Foundation

struct CharacterResponse: Codable {
    let results: [CharacterModel]
}

struct CharacterModel: Identifiable, Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin: Origin
    let location: Location
    let image: String
    let url: String
    let created: String

    enum Status: String, Codable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }

    enum Species: String, Codable {
        case alien = "Alien"
        case human = "Human"
        case other 

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let raw = try container.decode(String.self)
            self = Species(rawValue: raw) ?? .other
        }
    }

    enum Gender: String, Codable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"
    }

    struct Origin: Codable {
        let name: String
        let url: String
    }

    struct Location: Codable {
        let name: String
        let url: String
    }
}
