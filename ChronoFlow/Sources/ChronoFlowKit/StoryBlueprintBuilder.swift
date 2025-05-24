import Foundation

public final class StoryBlueprintBuilder {
    public init() {}

    public func buildBlueprint(from assets: [MediaAsset], themeID: String) -> Blueprint {
        let calendar = Calendar.current
        let grouped = Dictionary(grouping: assets) { asset in
            calendar.startOfDay(for: asset.creationDate)
        }

        var clips: [Blueprint.Clip] = []
        for (_, assets) in grouped.sorted(by: { $0.key < $1.key }) {
            for asset in assets {
                let clip = Blueprint.Clip(assetLocalIdentifier: asset.id, startTime: 0, duration: 5)
                clips.append(clip)
            }
        }
        return Blueprint(themeID: themeID, clips: clips)
    }

    public func saveBlueprint(_ blueprint: Blueprint, to url: URL) throws {
        let data = try JSONEncoder().encode(blueprint)
        try data.write(to: url)
    }
}
