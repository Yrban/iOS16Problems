//
//  OverRiddenAnimationView.swift
//  iOS16Problems
//
//  Created by Bryan on 12/12/22.
//

import SwiftUI

struct PanningImage: View {
    let systemName: String
    @State private var zoomPadding: CGFloat = 0
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: self.systemName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.leading, -100 * self.zoomPadding)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .padding()
                .border(Color.gray)
                .onAppear {
                    let animation = Animation.linear.speed(0.5).repeatForever()
                    withAnimation(animation) {
                        self.zoomPadding = abs(sin(zoomPadding + 10))
                    }
                }
            Spacer()
        }
        .padding()
    }
}

struct OverRiddenAnimationView: View {
    
    @State private var imageNames: [String] = []
    @State var isAnimating = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(self.imageNames, id: \.self) { imageName in
                        PanningImage(systemName: imageName)
                    }
                    // Please uncomment to see the problem
                    .animation(.default, value: isAnimating)
                    .transition(.move(edge: .top))
                }
            }
            .toolbar(content: {
                Button("Add") {
                    imageNames.append("photo")
                    isAnimating = true
                }
            })
        }
    }
}

struct OverRiddenAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        OverRiddenAnimationView()
    }
}
