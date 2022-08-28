//
//  ListSecHeaderHeightView.swift
//  iOS16Problems
//
//  Created by Beta Test on 8/28/22.
//

import SwiftUI

struct ListSecHeaderHeightView: View {
    var body: some View {
        List {
            Section(header: SectionView(text: "Section 1")) {
                Text("TaskRow")
                Text("TaskRow")
                Text("TaskRow")
            }
            
            Section(header: SectionView(text: "Section 2")) {
                Text("TaskRow")
                Text("TaskRow")
                Text("TaskRow")
            }
            
        }
        .scrollContentBackground(.hidden)
        .background(Color.gray)
        .listStyle(.plain)
        .environment(\.defaultMinListHeaderHeight, 12)
    }
}

struct SectionView: View {
    let text: String
    var body: some View {
        HStack {
            Text(text)
                .font(.system(.title3))
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .listRowInsets(EdgeInsets(top: -20, leading: 20, bottom: 0, trailing: 0))
    }
}


struct ListSecHeaderHeightView_Previews: PreviewProvider {
    static var previews: some View {
        ListSecHeaderHeightView()
    }
}
