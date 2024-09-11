//
//  SwiftDataWidget+EntryView.swift
//  LearnWidgetKit
//
//  Created by hs on 9/11/24.
//

import SwiftUI

extension SwiftDataWidget {
    struct EntryView: View {
        let entry: Entry

        var body: some View {
            VStack(alignment: .leading) {
                contentView
            }
            .containerBackground(.clear, for: .widget)
        }
    }
}

// MARK: - Content
extension SwiftDataWidget.EntryView {
    @ViewBuilder
    private var contentView: some View {
        ForEach(entry.item) { item in
            Text("- \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
        }
        
        if entry.item.isEmpty {
            Text("Item unavailable")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}
