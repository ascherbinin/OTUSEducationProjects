//
//  SegmentedChartsView.swift
//  OTUSHomeWorks
//
//  Created by Scherbinin Andrey on 23.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct SegmentedChartsView: View {

    @EnvironmentObject var chartsViewModel: ChartsViewModel

    @State private var segments = ["GIT", "MORTY", "RICK"]

    var body: some View {
        NavigationView {
            VStack {
                Picker("Endpoints", selection: $chartsViewModel.selectorIndex) {
                    ForEach(0 ..< segments.count) { index in
                        Text(self.segments[index]).tag(index)
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 10)
                .pickerStyle(SegmentedPickerStyle())
                List(chartsViewModel.models) { model in
                    // Cell
                    VStack(alignment: .leading) {
                        Text(model.model.name ?? "")
                        Text(model.model.type ?? "")
                        // Loading
//                        if self.listViewModel.isNewPageLoading && self.listViewModel.models.isLastItem(model) {
//                            Divider()
//                            HStack() {
//                                Spacer()
//                                ActivityIndicatorView()
//                                Spacer()
//                            }
//                        }
                    }.onAppear {
                        self.chartsViewModel.load()
                    }
                }
                .navigationBarTitle("Segments", displayMode: .inline)
            }
        }
    }
}

struct SegmentedChartsView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedChartsView().environmentObject(ChartsViewModel())
    }
}

