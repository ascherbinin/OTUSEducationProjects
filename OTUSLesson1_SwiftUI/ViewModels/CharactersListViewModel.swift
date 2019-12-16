//
//  CharactersListViewModel.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 16.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import Combine

final class CharactersListViewModel: ObservableObject {

    @Published private(set) var characters = [ModelCharacter]()
    @Published var pageIndex: Int = 1
    @Published var isNewPageLoading = false

    init() {
        pageLoad()
    }

    // Network simulation
    func pageLoad() {
        guard isNewPageLoading == false else {
            return
        }
        isNewPageLoading = true
        self.pageIndex += 1
        CharactersAPI.charactersGet(page: pageIndex)
        { list, error in
            self.characters.append(contentsOf: list?.results ?? [])
            self.isNewPageLoading = false
        }
    }
}

extension ModelCharacter: Identifiable { }
