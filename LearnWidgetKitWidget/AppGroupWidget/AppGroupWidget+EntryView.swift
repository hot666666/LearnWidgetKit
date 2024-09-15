//
//  UserDefaultsWidget+EntryView.swift
//  LearnWidgetKit
//
//  Created by hs on 9/15/24.
//

import SwiftUI

extension AppGroupWidget {
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
extension AppGroupWidget.EntryView {
    @ViewBuilder
    private var contentView: some View {
        Text("인사말")
            .font(.subheadline)
            .bold()
        Group {
            Text("UserDefaults: \(entry.userDefaults)")
            Text("FileManager: \(entry.file)")
        }
        .font(.footnote)
        .foregroundStyle(.secondary)
    }
}
