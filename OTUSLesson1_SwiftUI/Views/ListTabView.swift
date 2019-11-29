//
//  ListTabView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 29.11.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct ListTabView: View {

    init() {
        UITableView.appearance().separatorStyle = .none
    }

    @ObservedObject var viewModel = MatchesListViewModel()
    
    var body: some View {

        NavigationView {
            List {
                ForEach(viewModel.matches) { match in
                    NavigationLink(destination: MatchDetailsView(match: match)) {
                        Text(match.name)
                    }
                }
            }
            .navigationBarTitle("Matches")
        }
    }
}

struct ListTabView_Previews: PreviewProvider {
    static var previews: some View {
        ListTabView()
    }
}
