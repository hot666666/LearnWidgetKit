//
//  FileManager+Extension.swift
//  LearnWidgetKit
//
//  Created by hs on 9/15/24.
//

import Foundation

extension FileManager {
    static func loadStringFromFile(filename: String) -> String? {
        let url = appGroupContainerURL.appendingPathComponent(filename)
        do {
            return try String(contentsOf: url, encoding: .utf8)
        } catch {
            print("Error reading from file: \(error)")
        }
        return nil
    }

    static func saveStringToFile(_ value: String, filename: String) {
        let url = appGroupContainerURL.appendingPathComponent(filename)
        do {
            try value.write(to: url, atomically: false, encoding: .utf8)
        } catch {
            print("Error writing to file: \(error)")
        }
    }
}

// MARK: - App Group

extension FileManager {
    static let appGroupContainerURL = FileManager.default.containerURL(
        forSecurityApplicationGroupIdentifier: Shared.appGroupName
    )!
}
