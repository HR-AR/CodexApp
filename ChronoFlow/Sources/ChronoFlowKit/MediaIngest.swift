import Foundation
import Photos
import UIKit

public final class MediaIngest {
    public init() {}

    public func requestAccess(completion: @escaping (Bool) -> Void) {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            completion(status == .authorized || status == .limited)
        }
    }

    public func fetchAssets(from startDate: Date, to endDate: Date, mediaTypes: [PHAssetMediaType]) -> [PHAsset] {
        let options = PHFetchOptions()
        options.predicate = NSPredicate(format: "(creationDate >= %@) AND (creationDate <= %@) AND mediaType IN %@", startDate as NSDate, endDate as NSDate, mediaTypes.map { $0.rawValue })
        let result = PHAsset.fetchAssets(with: options)
        var assets: [PHAsset] = []
        result.enumerateObjects { asset, _, _ in
            assets.append(asset)
        }
        return assets
    }

    public func loadThumbnail(for asset: PHAsset, size: CGSize = CGSize(width: 200, height: 200)) async -> UIImage {
        await withCheckedContinuation { cont in
            let options = PHImageRequestOptions()
            options.isSynchronous = false
            PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: options) { image, _ in
                cont.resume(returning: image ?? UIImage())
            }
        }
    }
}
