//
//  SwiftDataWidget+Entry.swift
//  LearnWidgetKit
//
//  Created by hs on 9/11/24.
//

import WidgetKit

extension SwiftDataWidget {
    struct Entry: TimelineEntry {
        var date: Date = .now
        var item: [Item] = []
    }
}

// MARK: - Data
extension SwiftDataWidget.Entry {
    static var empty: Self {
        .init()
    }

    static var placeholder: Self {
        .init(item: Item.stubs)
    }
}

// MARK: - SwiftData Model
extension Item {
    static let stubs = [Item(timestamp: .now)]
}
