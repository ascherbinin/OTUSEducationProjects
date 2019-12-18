//
//  CharactersListView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 16.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct MultiModelsListView: View {

    @EnvironmentObject var listViewModel: MultiModelsListViewModel

    @State private var endpoints = ["Characters","Locations"]

    var body: some View {
        NavigationView {
            VStack {
                Picker("Endpoints", selection: $listViewModel.selectorIndex) {
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
                        if self.listViewModel.isNewPageLoading && self.listViewModel.models.isLastItem(model) {
                            Divider()
                            HStack() {
                                Spacer()
                                ActivityIndicatorView()
                                Spacer()
                            }
                        }
                    }.onAppear {
                        self.onItemShowed(model)
                    }
                }
                .navigationBarTitle("Characters")
            }
        }
    }


}

extension MultiModelsListView {
    private func onItemShowed<T:Identifiable>(_ item: T) {
        // Load
        if self.listViewModel.models.isLastItem(item) {
            self.listViewModel.apply(.onLastItem)
        }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        MultiModelsListView().environmentObject(MultiModelsListViewModel())
    }
}
