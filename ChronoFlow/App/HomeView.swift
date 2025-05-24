import SwiftUI
import ChronoFlowKit

struct HomeView: View {
    @EnvironmentObject var model: AppViewModel
    @State private var startDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())!
    @State private var endDate = Date()

    var body: some View {
        NavigationView {
            Form {
                DatePicker("Start", selection: $startDate, displayedComponents: .date)
                DatePicker("End", selection: $endDate, displayedComponents: .date)
                Picker("Theme", selection: $model.selectedTheme) {
                    ForEach(ThemeEngine.all, id: \.id) { theme in
                        Text(theme.id).tag(theme)
                    }
                }
                Button("Create") {
                    model.loadAssets(from: startDate, to: endDate)
                    model.createBlueprint()
                }
            }
            .navigationTitle("ChronoFlow")
        }
    }
}
