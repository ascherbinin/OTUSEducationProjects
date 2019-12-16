//
//  RandomAccessCollectionExtensions.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 16.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {

    public func isLastItem<Item: Identifiable>(_ item: Item) -> Bool {
        guard !isEmpty else {
            return false
        }

        guard let itemIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }

        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance == 1
    }

}
