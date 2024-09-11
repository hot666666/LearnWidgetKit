//
//  SwiftDataWidget.swift
//  LearnWidgetKit
//
//  Created by hs on 9/11/24.
//

import SwiftUI
import WidgetKit

struct SwiftDataWidget: Widget {
    private let kind = "SwiftDataExample"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) {
            EntryView(entry: $0)
        }
        .configurationDisplayName("SwiftData Widget")
        .description("SwiftData를 통한 데이터 전달")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

// MARK: - Preview
#Preview(as: .systemSmall) {
    SwiftDataWidget()
} timeline: {
    SwiftDataWidget.Entry.empty
    SwiftDataWidget.Entry.placeholder
}
