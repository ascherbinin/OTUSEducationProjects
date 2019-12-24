//
//  AppState.swift
//  OTUSHomeWorks
//
//  Created by Scherbinin Andrey on 24.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import UIKit

class AppState {

    static var shared = AppState()

    var mainWindow: UIWindow?
    var secondWindow: UIWindow?

    private init() {}

    func toggleOverlay() {
        if let secondWindow = secondWindow {
            if secondWindow.isKeyWindow {
                mainWindow?.makeKeyAndVisible()
                secondWindow.isHidden = true
            } else {
                secondWindow.isHidden = false
                secondWindow.makeKeyAndVisible()
            }

        }
    }


}

