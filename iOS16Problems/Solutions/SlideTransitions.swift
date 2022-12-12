//
//  SlideTransitions.swift
//  iOS16Problems
//
//  Created by Bryan on 9/13/22.
//

import SwiftUI

enum ChartType: String {
    case chartA, chartB
}

//struct ChartViewA: View {
//    var body: some View {
//        Color.red
//    }
//}
//
//struct ChartViewB: View {
//    var body: some View {
//        Color.blue
//    }
//}

struct SlideTransitions: View {
    @AppStorage("chartType") var chartTypeAS: ChartType = .chartA
    @State private var chartType: ChartType = .chartA
    
    init() {
        // load initial value from persistent storage
        _chartType = State(initialValue: chartTypeAS)
    }
    
    var body: some View {

        Form {
            
            // Other sections
            
            Section {
                VStack {
                    switch chartType {
                    case .chartA:
                        ChartViewA()
                            .transition(.slide)
                    case .chartB:
                        ChartViewB()
                            .transition(.slide)
                    }
                }
                .onLongPressGesture {
                    if chartType == .chartA {
                        withAnimation {
                            chartType = .chartB
                        }
                    } else {
                        withAnimation {
                            chartType = .chartA
                        }
                    }
                }
            }
            .onChange(of: chartType) { value in
                // persist chart type
                chartTypeAS = value
            }
        }
    }
}


struct ChartViewA: View {
    
    var body: some View {
        Text("This is Chart View A")
    }
}

struct ChartViewB: View {
    
    var body: some View {
        Text("This is Chart View B")
    }
}

struct SlideTransitions_Previews: PreviewProvider {
    static var previews: some View {
        SlideTransitions()
    }
}
