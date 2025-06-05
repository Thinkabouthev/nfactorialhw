import SwiftUI

struct CharacterView: View {
    @StateObject private var viewModel: CharactersViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: CharactersViewModel())
    }

    var body: some View{
        NavigationView{
            if viewModel.isLoading{
                Text("Loading...")
            }
            else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .padding()
            }
            else {
                List(viewModel.characters) { character in
                    HStack() {
                        AsyncImage(url: URL(string: character.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 64, height: 64)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 2)
                        
                        VStack(alignment: .leading) {
                            Text(character.name)
                                .font(.headline)
                            Text("Species: \(character.species)")
                                .font(.subheadline)
                            Text("ID: \(character.id)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
                
            }
        }
        .navigationTitle("Rick and Morty")
        .task {
            await viewModel.loadCharacters()
        }
        }

}
#Preview {
    CharacterView()
}
