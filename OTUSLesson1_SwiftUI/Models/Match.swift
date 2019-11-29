//
//  Match.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 29.11.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import Foundation

struct Match: Identifiable {
    let id = UUID()
    let gameID: String
    let date: Date
    let stat: Statistics

    var name: String {
        return date.toString()
    }
}
