//
//  CustomScrollView.swift
//  OTUSHomeWorks
//
//  Created by Scherbinin Andrey on 18.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct CustomScrollView: UIViewRepresentable {

    var coordinator: Coordinator?

    let scrollViewSize = CGSize(width: UIScreen.main.bounds.size.width, height: 100)

    @Binding var selectorIndex: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false

        scrollView.contentSize = .init(width: scrollViewSize.width * 2, height: scrollViewSize.height)

        return scrollView
    }

    func updateUIView(_ myScrollView: UIScrollView, context: Context) {

        let button1 = UIButton(type: .system)

        let button2 = UIButton(type: .system)

        let buttonTitles = ["Characters", "Locations"]

        [button1, button2].enumerated().forEach { index, button in
            button.tag = index
            button.frame = CGRect(x: 20 + scrollViewSize.width * CGFloat(index), y: 20, width: scrollViewSize.width - 40, height: scrollViewSize.height - 40)

            button.backgroundColor = .darkGray
            button.layer.cornerRadius = 5
            button.clipsToBounds = true
            button.setTitleColor(.white, for: .normal)

            let font = UIFont.systemFont(ofSize: 30)
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.blue
            shadow.shadowBlurRadius = 5

            let attributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: UIColor.white,
                .shadow: shadow
            ]

            button.setAttributedTitle(NSAttributedString(string: buttonTitles[index], attributes: attributes), for: .normal)

            button.addTarget(context.coordinator, action: #selector(context.coordinator.buttonTapped(_:)), for: .touchUpInside)

            myScrollView.addSubview(button)
        }
    }

    class Coordinator: NSObject {
        var parent: CustomScrollView

        init(_ myScrollView: CustomScrollView) {
            self.parent = myScrollView
        }

        @objc func buttonTapped(_ button: UIButton) {
            parent.selectorIndex = button.tag
        }
    }
}

