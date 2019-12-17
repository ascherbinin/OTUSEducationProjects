//
//  CharactersListViewModel.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 16.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import Combine

final class CharactersListViewModel: ObservableObject {

    @Published private(set) var models = [AnyModel]()
    @Published var pageIndex: Int = 1
    @Published var isNewPageLoading = false
    @Published var selectorIndex: Int = 0

    private var cancellables: [AnyCancellable] = []

    //private let responseSubject = PassthroughSubject<SearchRepositoryResponse, Never>()

    private let onChangeEndpointSubject = PassthroughSubject<Int, Never>()
    private let onScrollToLastElementSubject = PassthroughSubject<Void, Never>()

    enum Input {
        case onChangeSegment(index: Int)
        case onLastItem
    }

    func apply(_ input: Input) {
        switch input {
        case .onChangeSegment(let index):
            onChangeEndpointSubject.send((index))
        case .onLastItem:
            onScrollToLastElementSubject.send(())
        }
    }

    init() {
        bind()
    }

    // Network simulation
    func pageLoad() {
        if selectorIndex == 0 {
            return CharactersAPI.characters(page: self.pageIndex)
            { list, error in
                let anyModels = list?.results.map { $0.map { AnyModel($0) } }
                self.models.append(contentsOf: anyModels ?? [])
                self.isNewPageLoading = false
            }
        }
        return LocationsAPI.locations(page: self.pageIndex)
        { list, error in
            let anyModels = list?.results.map { $0.map { AnyModel($0) } }
            self.models.append(contentsOf: anyModels ?? [])
            self.isNewPageLoading = false
        }
    }

    private func bind() {
        onChangeEndpointSubject
            .map { [ weak self] index -> () in
                guard let self = self else { return }
                if self.selectorIndex != index {
                    self.models.removeAll()
                    self.pageIndex = 1
                }
                self.pageLoad()
        }
        .sink { _ in }
        .store(in: &cancellables)

        onScrollToLastElementSubject
            .map { [ weak self] _ -> () in
                guard let self = self else { return }
                guard self.isNewPageLoading == false else {
                    return
                }
                self.isNewPageLoading = true
                self.pageIndex += 1
                self.pageLoad()
        }
        .sink { _ in }
        .store(in: &cancellables)

//        let responseStream = responsePublisher
//            .share()
//            .subscribe(responseSubject)
//
//        let trackingSubjectStream = trackingSubject
//            .sink(receiveValue: trackerService.log)
//
//        let trackingStream = onAppearSubject
//            .map { .listView }
//            .subscribe(trackingSubject)

//        let repositoriesStream = responseSubject
//                  .map { $0.items }
//                  .assign(to: \.repositories, on: self)
//
//        cancellables += [
//            responseStream
//        ]
    }
}

extension ModelCharacter: Identifiable, UniversalModel {
    var type: String? {
        return gender
    }
}

extension Location: Identifiable, UniversalModel { }

protocol UniversalModel {
    var id: Int? { get }
    var name: String? { get }
    var type: String? { get }
}

struct AnyModel: Identifiable {
    let id: Int?
    let model: UniversalModel

    init(_ model: UniversalModel) {
        self.model = model
        self.id = model.id
    }
}
