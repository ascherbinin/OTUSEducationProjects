//
//  ListTabView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 29.11.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct ListTabView: View {
    var body: some View {
        List {
            Text("First")
            Text("Secont")
            Text("Third")
        }
    }
}

struct ListTabView_Previews: PreviewProvider {
    static var previews: some View {
        ListTabView()
    }
}
