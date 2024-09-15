//
//  AppGroupContentView.swift
//  LearnWidgetKit
//
//  Created by hs on 9/15/24.
//

import SwiftUI
import WidgetKit

struct AppGroupContentView: View {
    @AppStorage(Shared.userDefualtKey, store: .appGroup) private var hello = ""

    var body: some View {
        VStack {
            contentView
        }
    }
}

// MARK: - Content
extension AppGroupContentView {
    @ViewBuilder
    private var contentView: some View {
        textInputView
        buttonView
    }

    private var textInputView: some View {
        TextField("인사말", text: $hello)
            .padding()
    }

    private var buttonView: some View {
        Button {
            saveToFile()
            reloadWidgetTimelines()
        } label: {
            Text("위젯 업데이트")
        }
    }
}

// MARK: - Helpers
extension AppGroupContentView {
    private func saveToFile() {
        FileManager.saveStringToFile(hello, filename: Shared.helloFilename)
    }

    private func reloadWidgetTimelines() {
        WidgetCenter.shared.reloadTimelines(ofKind: "UserDefualtsAndFileManager")
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        AppGroupContentView()
    }
}
