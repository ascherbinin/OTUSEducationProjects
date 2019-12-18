//
//  ActivityIndicatorView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 18.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        uiView.startAnimating()
    }
}
