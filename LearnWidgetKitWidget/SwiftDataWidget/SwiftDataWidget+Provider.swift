//
//  SwiftDataWidget+Provider.swift
//  LearnWidgetKit
//
//  Created by hs on 9/11/24.
//

import SwiftData
import WidgetKit

extension SwiftDataWidget {
    struct Provider: TimelineProvider {
        private let modelContext = ModelContext(Self.container)

        func placeholder(in context: Context) -> Entry {
            .placeholder
        }

        func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
            completion(.placeholder)
        }

        func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
            let items = fetch()
            if items.isEmpty {
                completion(.init(entries: [.empty], policy: .never))
                return
            }
    
            let entry = Entry(item: items)
            completion(.init(entries: [entry], policy: .never))
        }
    }
}

// MARK: - SwiftData ModelContainer
extension SwiftDataWidget.Provider {
    private static let container: ModelContainer = {
        do {
            return try ModelContainer(for: Item.self)
        } catch {
            print("Failed to create ModelContainer: \(error)")
            fatalError("\(error)")
        }
    }()
}

// MARK: - SwiftData fetch
extension SwiftDataWidget.Provider {
    private func fetch() -> [Item] {
        do {
            return try modelContext.fetch(FetchDescriptor<Item>())
        } catch {
            return []
        }
    }
}
