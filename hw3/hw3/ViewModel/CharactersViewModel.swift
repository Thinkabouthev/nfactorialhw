import Foundation

class CharactersViewModel: ObservableObject{
    @Published var characters: [CharacterModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func loadCharacters() async{
        isLoading = true
        errorMessage = nil
        do {
            characters = try await NetworkClient.shared.fetchCharacters()
        } catch {
            errorMessage = "Failed to load characters: \(error.localizedDescription)"
        }
        isLoading = false

    }
}
