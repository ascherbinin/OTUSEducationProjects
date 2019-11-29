//
//  MainTabView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 29.11.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct MainTabView: View {

    @State private var currentSelection = 0

    var body: some View {
        TabView(selection: $currentSelection) {
            FirstButtonTabView().tabItem {
                VStack {
                    Text("First")
                        .font(Font.headline)
                    Image(systemName: "textformat.superscript")
                }
            }.tag(0)
            ListTabView().tabItem {
                VStack {
                    Text("List")
                        .font(Font.headline)
                    Image(systemName: "list.bullet")
                }
            }.tag(1)
            ModalTabView().tabItem {
                VStack {
                    Text("Modal")
                        .font(Font.headline)
                    Image(systemName: "stop")
                }
            }.tag(2)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}