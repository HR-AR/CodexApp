import Foundation
import SwiftUI
import ChronoFlowKit

final class AppViewModel: ObservableObject {
    @Published var assets: [MediaAsset] = []
    @Published var selectedTheme: Theme = ThemeEngine.nostalgia
    @Published var blueprint: Blueprint?

    let ingest = MediaIngest()
    let builder = StoryBlueprintBuilder()

    func loadAssets(from start: Date, to end: Date) {
        let phAssets = ingest.fetchAssets(from: start, to: end, mediaTypes: [.image, .video])
        Task {
            var models: [MediaAsset] = []
            for asset in phAssets {
                let thumb = await ingest.loadThumbnail(for: asset)
                let url = URL(fileURLWithPath: "")
                models.append(MediaAsset(asset: asset, thumb: thumb, pixelURL: url))
            }
            await MainActor.run {
                self.assets = models
            }
        }
    }

    func createBlueprint() {
        blueprint = builder.buildBlueprint(from: assets, themeID: selectedTheme.id)
    }
}
