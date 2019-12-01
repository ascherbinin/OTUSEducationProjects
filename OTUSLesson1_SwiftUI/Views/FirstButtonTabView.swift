//
//  FirstButtonTabView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 29.11.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct FirstButtonTabView: View {

    @State private var isTapped: Bool = false
    @Binding var currentSelection: Int
    @Binding var fromFirstTab: Bool

    var body: some View {
        Button(action: {
            self.isTapped = true
            self.$fromFirstTab.wrappedValue = true
            self.$currentSelection.wrappedValue = 1
        }) {
            Text("Open second")
        }
        .font(Font.largeTitle)
    }
}

//struct FirstButtonTab_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstButtonTabView()
//    }
//}
