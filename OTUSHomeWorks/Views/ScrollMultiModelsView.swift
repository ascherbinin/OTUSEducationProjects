//
//  ScrollMultiModelsView.swift
//  OTUSHomeWorks
//
//  Created by Scherbinin Andrey on 18.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct ScrollMultiModelsView: View {

    @EnvironmentObject var listViewModel: MultiModelsListViewModel

    var body: some View {
        NavigationView {
            VStack {
                CustomScrollView(selectorIndex: $listViewModel.selectorIndex)
                    .frame(height: 100)
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

extension ScrollMultiModelsView {
    private func onItemShowed<T:Identifiable>(_ item: T) {
        // Load
        if self.listViewModel.models.isLastItem(item) {
            self.listViewModel.apply(.onLastItem)
        }
    }
}

struct ScrollMultiModelsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollMultiModelsView().environmentObject(MultiModelsListViewModel())
    }
}

