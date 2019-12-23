//
//  ChartsViewModel.swift
//  OTUSHomeWorks
//
//  Created by Scherbinin Andrey on 23.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import Combine
import APIClient

struct RepositoryResponse {
    let query: String
    let count: Int
}

struct Histogram {

    let interval: Double = 0.139
    let range = 2.0...260.0

    let histogram = [
        "2": 1,
        "3": 0,
        "4": 1,
        "5": 4,
        "6": 0,
        "7": 2,
        "8": 1,
        "9": 1,
        "10": 4,
        "11": 3,
        "13": 4,
        "15": 7,
        "17": 3,
        "19": 10,
        "22": 9,
        "25": 12,
        "29": 6,
        "33": 6,
        "38": 9,
        "43": 8,
        "50": 12,
        "57": 13,
        "65": 9,
        "75": 19,
        "86": 11,
        "99": 14,
        "113": 38,
        "130": 33,
        "150": 29,
        "172": 12,
        "197": 8,
        "227": 1,
        "260": 1
    ]

    var sorted: [(String, Int)] {
        return histogram.sorted(by: { Int($0.0) ?? 0 > Int($1.0) ?? 0 })
    }

}

final class ChartsViewModel: ObservableObject {

    @Published private(set) var gitRepositoriesDictionary = [String: Int]()
    @Published private(set) var mortyCharactersArray = [(String, Int)]()
    @Published private(set) var histogram = Histogram()
    @Published var selectorIndex: Int = 0
    
    private var cancellables: [AnyCancellable] = []


    func load() {
        loadGitRepositories(query: "ObjC")
        loadGitRepositories(query: "Swift")
        loadGitRepositories(query: "Kotlin")

        loadMortyCharactersStatus()
    }

    func loadGitRepositories(query: String) {
        SearchAPI.searchReposGet(q: query, order: .asc) { (list, error) in
            self.gitRepositoriesDictionary[query] = list?.totalCount
        }
    }

    func loadMortyCharactersStatus() {
        CharactersAPI.characters
        { list, error in
            guard let results = list?.results else { return }
            let charactersStatusDict = Dictionary(grouping: results, by: { $0.status ?? "UNKNOWN" }).map { ($0, $1.count) }
            self.mortyCharactersArray = charactersStatusDict
        }
    }
}
