//
//  ListTabView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 29.11.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI
import Combine

struct ListTabView: View {

    @ObservedObject var viewModel = MatchesListViewModel()
    @Binding var fromFirstTab: Bool
    
    var body: some View {

        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.matches) { match in
                        NavigationLink(destination: MatchDetailsView(match: match)) {
                            Text(match.name)
                        }
                    }
                }
                .navigationBarTitle("Matches")
                NavigationLink(destination:
                    MatchDetailsView(match: viewModel.getRandomMatch()),
                               isActive: $viewModel.needShowRandomElements
                    )
                { EmptyView() }
            }

        }.onAppear {
            if self.fromFirstTab {
                self.viewModel.needShowRandomElements = true
                self.fromFirstTab = false
            }
        }

    }
}

struct ListTabView_Previews: PreviewProvider {

    @State static var notFirstTab = true

    static var previews: some View {
        ListTabView(fromFirstTab: $notFirstTab)
    }
}
