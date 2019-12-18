//
//  Statistics.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 29.11.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import Foundation

struct Statistics {
    let kills: Int
    let deaths: Int
    let assists: Int
    let isWin: Bool

    var kdr: Double {
        return Double(kills) / Double(deaths)
    }

    var kda: String {
        return "\(kills)/\(deaths)/\(assists)"
    }
}
