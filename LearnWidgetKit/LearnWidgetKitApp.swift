//
//  LearnWidgetKitApp.swift
//  LearnWidgetKit
//
//  Created by hs on 9/11/24.
//

import SwiftUI
import SwiftData
import WidgetKit

@main
struct LearnWidgetKitApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabView {
                SwiftDataContentView()
                    .tabItem {
                        Text("SwiftData")
                    }
                AppGroupContentView()
                    .tabItem {
                        Text("AppGroup")
                    }
            }
        }
        .onChange(of: scenePhase) { oldValue, newValue in
            if newValue == .inactive {
                updateWidget()
            }
        }
        .modelContainer(sharedModelContainer)
    }
    
    private func updateWidget() {
        WidgetCenter.shared.reloadTimelines(ofKind: "SwiftDataExample")
    }
}
