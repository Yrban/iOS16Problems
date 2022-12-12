//
//  LazyVGridWidthPercent.swift
//  iOS16Problems
//
//  Created by Bryan on 12/9/22.
//

import SwiftUI

struct LazyVGridWidthPercentView: View {
    
    var body: some View {
        GeometryReader { geometry in
            LazyVGrid(columns: [
                GridItem(.fixed(geometry.size.width * 0.2), alignment: .top),
                GridItem(.fixed(geometry.size.width * 0.4), alignment: .top),
                GridItem(.fixed(geometry.size.width * 0.4), alignment: .top)
            ], spacing: 5) {
                Text("locationColumn")
                Text("distanceColumn")
                Text("hoursColumn")
            }
        }
    }
}

struct LazyVGridWidthPercentView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridWidthPercentView()
    }
}
