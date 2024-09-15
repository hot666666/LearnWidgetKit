//
//  UserDefaultsWidget+Provider.swift
//  LearnWidgetKit
//
//  Created by hs on 9/15/24.
//

import WidgetKit

extension AppGroupWidget {
    struct Provider: TimelineProvider {
        func placeholder(in context: Context) -> Entry {
            .placeholder
        }

        func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
            completion(.placeholder)
        }

        func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
            let entry = Entry(
                userDefaults: fromUserDefaults,
                file: fromFile
            )
            completion(.init(entries: [entry], policy: .never))
        }
    }
}

// MARK: - Helpers
extension AppGroupWidget.Provider {
    private var fromUserDefaults: String {
        UserDefaults.appGroup.string(forKey: Shared.userDefualtKey) ?? ""
    }

    private var fromFile: String {
        let value = FileManager.loadStringFromFile(
            filename: Shared.helloFilename
        )
        return value ?? ""
    }
}

