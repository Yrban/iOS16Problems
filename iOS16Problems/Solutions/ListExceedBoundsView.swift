//
//  ListExceedBoundsView.swift
//  iOS16Problems
//
//  Created by Bryan on 9/18/22.
//

import SwiftUI

struct ListExceedBoundsView: View {

    @StateObject var model = ListExceedBoundsViewModel()
    
    var body: some View {
        ZStack {
            List {
                ForEach($model.listContent) { $content in
                    Section() {
                        
                        listElement(text: content.text)
                            .listRowInsets(EdgeInsets())
                    }
                }
            }
            ForEach(model.listContent) { content in
                BarView(barCount: content.barCount, barColor: content.barLocation != nil ? .green : .clear)
            }
        }
    }
  }

class ListExceedBoundsViewModel: ObservableObject {
    
    @Published var listContent: [ListModel] = [
        ListModel(text: "This", barCount: 0),
        ListModel(text: "is", barCount: 0),
        ListModel(text: "a", barCount: 0),
        ListModel(text: "placeholder", barCount: 0),
        ListModel(text: "list", barCount: 0)
        ]
}
  struct listElement: View {
    @State var text: String
    
      var body: some View {
          ZStack(alignment: .leading) {
              HStack {
                  Rectangle()
                      .fill()
                      .frame(width: 30, height: nil)
                  Text(text)
              }
          }
      }
  }

struct ListModel: Identifiable, Hashable {
    let id = UUID()
    let text: String
    let barCount: Int
    var barLocation: CGPoint?
}

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

struct BarView: View {
    
    let barCount: Int
    let barColor: Color
    
    var body: some View {
        VStack(spacing: 1) {
            ForEach(0..<barCount, id: \.self) { _ in
                Rectangle()
                    .fill(barColor)
                    .frame(width: 10, height: 2)
            }
        }
    }
}

struct ListExceedBoundsView_Previews: PreviewProvider {
    static var previews: some View {
        ListExceedBoundsView()
    }
}
