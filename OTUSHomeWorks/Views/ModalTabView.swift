//
//  ModalTabView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 29.11.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct ModalTabView: View {

     @State private var isShowedModal: Bool = false

    var body: some View {
        Button(action: {
                   self.isShowedModal = true
               }) {
                   Text("Open modal")
               }
               .font(Font.largeTitle)
    .sheet(isPresented: $isShowedModal, onDismiss: { print("Dismiss modal")}) {
        ModalView()
    }
    }
}

struct ModalTabView_Previews: PreviewProvider {
    static var previews: some View {
        ModalTabView()
    }
}
