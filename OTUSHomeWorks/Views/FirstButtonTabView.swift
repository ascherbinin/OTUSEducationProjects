//
//  FirstButtonTabView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 29.11.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct FirstButtonTabView: View {

    @Binding var currentSelection: Int
    @Binding var fromFirstTab: Bool

    var body: some View {
        Button(action: {
            self.fromFirstTab = true
            self.currentSelection = 1
        }) {
            Text("Open second")
        }
        .font(Font.largeTitle)
    }
}
