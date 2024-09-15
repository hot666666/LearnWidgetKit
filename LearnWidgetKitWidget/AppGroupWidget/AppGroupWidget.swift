//
//  UserDefaultsWidget.swift
//  LearnWidgetKit
//
//  Created by hs on 9/15/24.
//

import SwiftUI
import WidgetKit

struct AppGroupWidget: Widget {
    private let kind = "UserDefualtsAndFileManager"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) {
            EntryView(entry: $0)
        }
        .configurationDisplayName("UserDefaults/FileManager Widget")
        .description("UserDefaults와 FileManager를 통한 데이터 전달")
        .supportedFamilies([.systemSmall])
    }
}

// MARK: - Preview
#Preview(as: .systemSmall) {
    AppGroupWidget()
} timeline: {
    AppGroupWidget.Entry.placeholder
}
