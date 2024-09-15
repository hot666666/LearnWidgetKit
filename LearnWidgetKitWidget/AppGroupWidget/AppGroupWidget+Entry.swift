//
//  Untitled.swift
//  LearnWidgetKit
//
//  Created by hs on 9/15/24.
//

import WidgetKit

extension AppGroupWidget {
    struct Entry: TimelineEntry {
        var date: Date = .now
        let userDefaults: String
        let file: String
    }
}

// MARK: - Data
extension AppGroupWidget.Entry {
    static var placeholder: Self {
        .init(userDefaults: "Hello world!", file: "Hello world!")
    }
}
