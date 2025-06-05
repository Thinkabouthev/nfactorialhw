import Foundation

class NetworkClient {
    static let shared = NetworkClient()
    
    private init() {}
    
    func fetchCharacters() async throws -> [CharacterModel] {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
       
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
        return decoded.results
    }
}
