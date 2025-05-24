import Foundation
import BackgroundTasks

public final class BackgroundProcessingManager {
    public static let shared = BackgroundProcessingManager()
    private init() {}

    public func scheduleProcessing() {
        let request = BGProcessingTaskRequest(identifier: "com.example.chronoflow.processing")
        request.requiresNetworkConnectivity = false
        request.requiresExternalPower = false
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Failed to schedule BGTask: \(error)")
        }
    }
}
