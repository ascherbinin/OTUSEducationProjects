//
//  MatchesListViewModel.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 29.11.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import Foundation

struct Constants {
     static let dotaId = "113"
}

final class MatchesListViewModel: ObservableObject {

    @Published var needShowRandomElements = false

    @Published private(set) var matches = [
        Match(gameID: Constants.dotaId, date: Date(),
              stat: Statistics(kills: 3, deaths: 2, assists: 0, isWin: false)),
        Match(gameID: Constants.dotaId, date: Date(),
              stat: Statistics(kills: 6, deaths: 3, assists: 1, isWin: true)),
        Match(gameID: Constants.dotaId, date: Date(),
              stat: Statistics(kills: 1, deaths: 6, assists: 2, isWin: false)),
        Match(gameID: Constants.dotaId, date: Date(),
              stat: Statistics(kills: 6, deaths: 1, assists: 3, isWin: false))
    ]

    func getRandomMatch() -> Match {
        return matches.randomElement()!
    }

    func getMatchByIndex(index: Int) -> Match? {
        if matches.count == 0 || index > matches.count {
            return nil
        }
        return matches[index]
    }
}
