//
//  MatchDetailsView.swift
//  OTUSLesson1_SwiftUI
//
//  Created by Scherbinin Andrey on 29.11.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI

struct MatchDetailsView: View {

    var match: Match

    var body: some View {
        
        List {
            Text("Kills - \(match.stat.kills)")
            Text("Deaths - \(match.stat.deaths)")
            Text("Assists - \(match.stat.assists)")
            Divider()
            Text("KDR - \(match.stat.kdr)")
            Text("KDA - \(match.stat.kda)")
            Divider()
            Text(match.stat.isWin ? "Win" : "Lose")
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .font(Font.largeTitle)
                .foregroundColor(match.stat.isWin ? .green : .red)
        }
        .navigationBarTitle(Text(match.name), displayMode: .inline)
    }
}
