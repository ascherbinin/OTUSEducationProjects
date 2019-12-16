//
//  CharactersListView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 16.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct CharactersListView: View {

    @EnvironmentObject var charactersListViewModel: CharactersListViewModel

    var body: some View {
        NavigationView {
            List(charactersListViewModel.characters) { character in
                // Cell
                VStack(alignment: .leading) {
                    Text(character.name ?? "")
                    Text(character.gender ?? "")
                    // Loading
                    if self.charactersListViewModel.isNewPageLoading && self.charactersListViewModel.characters.isLastItem(character) {
                        Divider()
                        Text("Loading...")
                    }
                }.onAppear {
                    self.onItemShowed(character)
                }
            }
            .navigationBarTitle("Characters")
        }
    }


}

extension CharactersListView {
    private func onItemShowed<T:Identifiable>(_ item: T) {
        // Load
        if self.charactersListViewModel.characters.isLastItem(item) {
            self.charactersListViewModel.pageLoad()
        }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView().environmentObject(CharactersListViewModel())
    }
}
