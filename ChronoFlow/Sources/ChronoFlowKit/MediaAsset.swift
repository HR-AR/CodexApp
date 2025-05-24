import Foundation
import UIKit
import Photos
import CoreLocation

public struct MediaAsset: Identifiable {
    public let id: String
    public let thumb: UIImage
    public let creationDate: Date
    public let location: CLLocation?
    public let pixelURL: URL

    public init(asset: PHAsset, thumb: UIImage, pixelURL: URL) {
        self.id = asset.localIdentifier
        self.thumb = thumb
        self.creationDate = asset.creationDate ?? Date()
        self.location = asset.location
        self.pixelURL = pixelURL
    }
}
