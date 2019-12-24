//
//  SegmentedChartsView.swift
//  OTUSHomeWorks
//
//  Created by Scherbinin Andrey on 23.12.2019.
//  Copyright © 2019 Scherbinin Andrey. All rights reserved.
//

import SwiftUI
import SwiftUICharts

enum Segments: Int, CaseIterable {
    case pie
    case bar
    case line

    var title: String {
        switch self {
        case .pie:
            return "PIE"
        case .bar:
            return "BAR"
        case .line:
            return "LINE"
        }
    }
}

struct SegmentedChartsView: View {

    @EnvironmentObject var chartsViewModel: ChartsViewModel

    @State private var segments = Segments.allCases

    var body: some View {
        VStack {
            Picker("Endpoints", selection: $chartsViewModel.selectorIndex) {
                ForEach(0 ..< segments.count) { index in
                    Text(self.segments[index].title).tag(index)
                }
            }
            .padding(.horizontal, 15)
            .padding(.top, 10)
            .pickerStyle(SegmentedPickerStyle())

            CurrentChartView(currentSegmentIndex: $chartsViewModel.selectorIndex,
                             gitDictionaries: chartsViewModel.gitRepositoriesDictionary,
                             mortyCharactersArray: chartsViewModel.mortyCharactersArray,
                             histogram: chartsViewModel.histogram)
            Button(action: { AppState.shared.toggleOverlay() }) {
                Text("Close")
            }.padding()
        }
        .background(Color.white)
        .cornerRadius(30)
        .overlay(RoundedRectangle(cornerRadius: 30)
            .stroke(Color.orange, lineWidth: 4))
        .shadow(radius: 10)
        .padding(16)
        .onAppear {
            self.chartsViewModel.load()
        }

    }
}

struct CurrentChartView: View {

    @Binding var currentSegmentIndex: Int
    var gitDictionaries: [String: Int]
    var mortyCharactersArray: [(String, Int)]
    var histogram: Histogram

    var body: some View {
        GeometryReader { geometry in
            self.containedView(width: geometry.size.width,
                               height: geometry.size.height)
        }
    }

    func containedView(width: CGFloat, height: CGFloat) -> AnyView {

        guard let currentSegment = Segments(rawValue: currentSegmentIndex) else { return AnyView(EmptyView()) }
        switch currentSegment {
        case .pie:
            // Fix this smell code
            guard gitDictionaries.count == 3 else { return AnyView(CenteredActivityView()) }
            let data = gitDictionaries.map { $1 }
            let legend = gitDictionaries.sorted(by: { $0.1 > $1.1 }).map { "\($0) - \($1)"}.joined(separator: "\n")
            let pieChartView = PieChartView(data: data,
                                            title: currentSegment.title,
                                            legend: legend,
                                            form: CGSize(width: width,
                                                         height: height),
                                            dropShadow: false)
            return AnyView(pieChartView)
        case .bar:
            guard mortyCharactersArray.count > 0 else { return AnyView(CenteredActivityView()) }
            let data = mortyCharactersArray.map { $1 }
            let legend = mortyCharactersArray.sorted(by: { $0.1 > $1.1 }).map { "\($0) - \($1)"}.joined(separator: " ")
            let barChartView = BarChartWithLegendView(title: currentSegment.title,
                                                      data: data,
                                                      legend: legend,
                                                      width: width,
                                                      height: height)

            return AnyView(barChartView)
        case .line:
            let data = histogram.sorted.map { $1 }
            let lineChartView = LineView(data: data,
                                         title: currentSegment.title)
            return AnyView(lineChartView.padding())
        }
    }
}

struct CenteredActivityView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack() {
                Spacer()
                ActivityIndicatorView()
                Spacer()
            }
            Spacer()
        }

    }
}

struct BarChartWithLegendView: View {

    var title: String
    var data: [Int]
    var legend: String
    var width: CGFloat
    var height: CGFloat

    var body: some View {
        VStack(alignment: .center) {
            BarChartView(data: data, title: title, form: CGSize(width: width - 20,
                                                                height: height - 60),
                         dropShadow: false)
            Text(self.legend)
            .font(.headline)
            .foregroundColor(Color.gray)
            .padding(4)
        }

    }
}

struct SegmentedChartsView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedChartsView().environmentObject(ChartsViewModel())
    }
}

