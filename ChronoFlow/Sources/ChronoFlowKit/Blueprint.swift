import Foundation

public struct Blueprint: Codable {
    public struct Clip: Codable {
        public let assetLocalIdentifier: String
        public let startTime: TimeInterval
        public let duration: TimeInterval
        public init(assetLocalIdentifier: String, startTime: TimeInterval, duration: TimeInterval) {
            self.assetLocalIdentifier = assetLocalIdentifier
            self.startTime = startTime
            self.duration = duration
        }
    }
    public let themeID: String
    public let clips: [Clip]
    public init(themeID: String, clips: [Clip]) {
        self.themeID = themeID
        self.clips = clips
    }
}
