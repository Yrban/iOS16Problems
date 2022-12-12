//
//  VStackTransitions.swift
//  iOS16Problems
//
//  Created by Bryan on 12/9/22.
//

import SwiftUI

struct VStackTransitions: View {
    
    @State private var colors: [Color] = []
    
    var body: some View {
        VStack {
            ForEach(self.colors, id: \.hashValue) { color in
                color.frame(maxHeight: 30)
            }
//            .transition(.move(edge: .top)) // <--- This animation works
//            .transition(.slide)
//            .transition(.scale)
            .transition(.opacity)

            Spacer()
            Button("Add color") {
                withAnimation {
                    self.colors.insert(Color.random, at: 0)
                }
            }
        }
    }
}

struct VStackTransitions_Previews: PreviewProvider {
    static var previews: some View {
        VStackTransitions()
        VStackTransitions()
        VStackTransitions()
        VStackTransitions()
    }
}

extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}
