//
//  ChartsViewModel.swift
//  OTUSHomeWorks
//
//  Created by Scherbinin Andrey on 23.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import Combine
import APIClient

final class ChartsViewModel: ObservableObject {

    @Published private(set) var models = [AnyModel]()
    @Published var selectorIndex: Int = 0
    
    private var cancellables: [AnyCancellable] = []

    func load() {
        CharactersAPI.characters(page: 1)
        { list, error in
            let anyModels = list?.results.map { $0.map { AnyModel($0) } }
            self.models.append(contentsOf: anyModels ?? [])
        }
    }
}
