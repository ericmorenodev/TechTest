//
//  DetailView.swift
//  TechTest
//
//  Created by Eric Moreno on 17/9/23.
//

import SwiftUI

struct DetailView: View {
    @StateObject var presenter: DetailPresenter
    @State private var uiImage: UIImage? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 5)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }

            Text(presenter.RMCharacter.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Status: \(presenter.RMCharacter.status.rawValue)")
                .font(.headline)

            Text("Species: \(presenter.RMCharacter.species)")
                .font(.headline)

            Text("Type: \(presenter.RMCharacter.type)")
                .font(.headline)

            Text("Gender: \(presenter.RMCharacter.gender.rawValue)")
                .font(.headline)

            Text("Origin: \(presenter.RMCharacter.origin.name)")
                .font(.headline)

            Text("Location: \(presenter.RMCharacter.location.name)")
                .font(.headline)

            Text("Created: \(presenter.RMCharacter.created)")
                .font(.headline)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadImage()
        }
    }

    private func loadImage() {
        guard let imageUrl = presenter.RMCharacter.image, let url = URL(string: imageUrl) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.uiImage = uiImage
                }
            }
        }.resume()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let rmCharacter = RMCharacter(
            characterId: 1,
            name: "Rick Sanchez",
            status: .alive,
            species: "Human",
            type: "Mad Scientist",
            gender: .male,
            origin: RMOrigin(name: "Earth", url: "https://earth.example.com"),
            location: RMLocation(name: "Earth", url: "https://earth.example.com"),
            image: "https://example.com/rick.png",
            episodes: [URL(string: "https://example.com/episode1")!],
            characterURL: URL(string: "https://example.com/rick")!,
            created: "2023-09-17T12:34:56.789Z"
        )

        let presenter = DetailPresenter(interactor: DetailInteractor(rmCharacter: rmCharacter))
        return DetailView(presenter: presenter)
    }
}

struct RMCharacter: PeopleAPIProtocol {
    var characterId: Int
    var name: String
    var status: Status
    var species: String
    var type: String
    var gender: Gender
    var origin: Origin
    var location: LocationOfCharacter
    var image: String?
    var episodes: [URL]
    var characterURL: URL
    var created: String
}

struct RMOrigin: Origin {
    var name: String
    var url: String
}

struct RMLocation: LocationOfCharacter {
    var name: String
    var url: String
}
