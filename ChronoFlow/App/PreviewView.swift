import SwiftUI
import ChronoFlowKit

struct PreviewView: View {
    @EnvironmentObject var model: AppViewModel
    @State private var showShare = false

    var body: some View {
        VStack {
            if let blueprint = model.blueprint {
                Text("Draft with theme: \(blueprint.themeID)")
            } else {
                Text("No Draft")
            }
            HStack {
                Button("Remove") {
                    // placeholder
                }
                Button("Add") {
                    // placeholder
                }
            }
            Picker("Theme", selection: $model.selectedTheme) {
                ForEach(ThemeEngine.all, id: \.id) { theme in
                    Text(theme.id).tag(theme)
                }
            }
            Button("Share") {
                showShare = true
            }
        }
        .sheet(isPresented: $showShare) {
            ActivityViewController(activityItems: [URL(fileURLWithPath: "")])
        }
    }
}

struct ActivityViewController: UIViewControllerRepresentable {
    let activityItems: [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
