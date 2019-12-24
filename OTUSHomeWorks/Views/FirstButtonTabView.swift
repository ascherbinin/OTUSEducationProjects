//
//  FirstButtonTabView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 29.11.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct ButtonPressStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .font(Font.largeTitle)
      .padding(8)
      .foregroundColor(.white)
      .background(configuration.isPressed ? Color.gray : Color.blue)
      .cornerRadius(10.0)
  }

}

struct FirstButtonTabView: View {

    @Binding var currentSelection: Int
    @Binding var fromFirstTab: Bool

    var body: some View {
        Button(action: {
            AppState.shared.toggleOverlay()
        }) {
            Text("Overlay Window")
        }
        .buttonStyle(ButtonPressStyle())
    }
}
