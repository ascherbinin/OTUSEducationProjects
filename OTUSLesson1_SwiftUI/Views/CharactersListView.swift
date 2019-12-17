//
//  CharactersListView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 16.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct CharactersListView: View {

    @EnvironmentObject var listViewModel: CharactersListViewModel

    @State private var selectorIndex = 0
    @State private var endpoints = ["Characters","Locations"]

    private var segmentProxy:Binding<Int> {
        Binding<Int>(get: { self.selectorIndex },
                     set: {
            self.selectorIndex = $0
            self.listViewModel.apply(.onChangeSegment(index: $0))
            self.listViewModel.selectorIndex = $0
        })
    }

    var body: some View {
        NavigationView {
            VStack {
                Picker("Endpoints", selection: segmentProxy) {
                    ForEach(0 ..< endpoints.count) { index in
                        Text(self.endpoints[index]).tag(index)
                    }
                }
                .padding(.horizontal, 15)
                .pickerStyle(SegmentedPickerStyle())
                List(listViewModel.models) { model in
                    // Cell
                    VStack(alignment: .leading) {
                        Text(model.model.name ?? "")
                        Text(model.model.type ?? "")
                        // Loading
//                        if self.charactersListViewModel.isNewPageLoading && self.charactersListViewModel.models.isLastItem(model) {
//                            Divider()
//                            Text("Loading...")
//                        }
                    }.onAppear {
                        self.onItemShowed(model)
                    }
                }
                .navigationBarTitle("Characters")
            }.onAppear {
                self.listViewModel.pageLoad()
            }
        }
    }


}

extension CharactersListView {
    private func onItemShowed<T:Identifiable>(_ item: T) {
        // Load
        if self.listViewModel.models.isLastItem(item) {
            self.listViewModel.apply(.onLastItem)
        }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView().environmentObject(CharactersListViewModel())
    }
}
