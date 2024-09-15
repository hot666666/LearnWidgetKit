//
//  UserDefaults+Extension.swift
//  LearnWidgetKit
//
//  Created by hs on 9/15/24.
//

import Foundation

extension UserDefaults {
    func setArray<Element>(_ array: [Element], forKey key: String) where Element: Encodable {
        let data = try? JSONEncoder().encode(array)
        set(data, forKey: key)
    }

    func getArray<Element>(forKey key: String) -> [Element]? where Element: Decodable {
        guard let data = data(forKey: key) else {
            return nil
        }
        return try? JSONDecoder().decode([Element].self, from: data)
    }
}

// MARK: - App Group
extension UserDefaults {
    static let appGroup = UserDefaults(suiteName: Shared.appGroupName)!
}
