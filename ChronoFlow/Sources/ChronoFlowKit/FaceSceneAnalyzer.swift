import Foundation
import Vision
import CoreML
import UIKit

public final class FaceSceneAnalyzer {
    private let faceModel: VNCoreMLModel
    private let sceneModel: VNCoreMLModel

    public init() {
        let faceURL = Bundle.module.url(forResource: "MobileFaceNet-Lite", withExtension: "mlmodelc", subdirectory: "Models.bundle")!
        let sceneURL = Bundle.module.url(forResource: "MobileViT_Scenes", withExtension: "mlmodelc", subdirectory: "Models.bundle")!
        faceModel = try! VNCoreMLModel(for: MLModel(contentsOf: faceURL))
        sceneModel = try! VNCoreMLModel(for: MLModel(contentsOf: sceneURL))
    }

    public func analyze(asset: MediaAsset, image: UIImage) async -> (faces: [VNFaceObservation], scene: String?) {
        let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        var faceObservations: [VNFaceObservation] = []
        var sceneName: String?
        let faceRequest = VNCoreMLRequest(model: faceModel) { req, _ in
            faceObservations = req.results as? [VNFaceObservation] ?? []
        }
        let sceneRequest = VNCoreMLRequest(model: sceneModel) { req, _ in
            if let first = req.results?.first as? VNClassificationObservation {
                sceneName = first.identifier
            }
        }
        try? handler.perform([faceRequest, sceneRequest])
        return (faceObservations, sceneName)
    }
}
