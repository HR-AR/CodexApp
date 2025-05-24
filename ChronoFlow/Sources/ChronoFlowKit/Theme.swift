import Foundation
import AVFoundation

public enum TransitionStyle: String, Codable {
    case crossFade
    case slide
    case zoom
}

public struct Theme: Hashable {
    public let id: String
    public let musicURL: URL
    public let bpm: Int
    public let lutURL: URL
    public let transition: TransitionStyle
}

public struct ThemeEngine {
    public static let nostalgia = Theme(
        id: "Nostalgia",
        musicURL: Bundle.module.url(forResource: "music", withExtension: "mp3", subdirectory: "Themes/Nostalgia")!,
        bpm: 80,
        lutURL: Bundle.module.url(forResource: "look", withExtension: "cube", subdirectory: "Themes/Nostalgia")!,
        transition: .crossFade
    )

    public static let upbeat = Theme(
        id: "Upbeat",
        musicURL: Bundle.module.url(forResource: "music", withExtension: "mp3", subdirectory: "Themes/Upbeat")!,
        bpm: 120,
        lutURL: Bundle.module.url(forResource: "look", withExtension: "cube", subdirectory: "Themes/Upbeat")!,
        transition: .slide
    )

    public static let epic = Theme(
        id: "Epic",
        musicURL: Bundle.module.url(forResource: "music", withExtension: "mp3", subdirectory: "Themes/Epic")!,
        bpm: 100,
        lutURL: Bundle.module.url(forResource: "look", withExtension: "cube", subdirectory: "Themes/Epic")!,
        transition: .zoom
    )

    public static let all: [Theme] = [nostalgia, upbeat, epic]

    public static func theme(with id: String) -> Theme? {
        return all.first { $0.id == id }
    }
}
