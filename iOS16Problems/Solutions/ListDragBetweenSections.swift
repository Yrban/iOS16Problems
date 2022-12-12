//
//  ListDragBetweenSections.swift
//  iOS16Problems
//
//  Created by Bryan on 10/3/22.
//

import SwiftUI

struct ListDragBetweenSections: View {
    @State private var alphabets = ["a", "b", "c"]
    @State private var numbers = ["1", "2", "3"]
    
    var body: some View {
        NavigationView {
            List {
                Section("Alphabets") {
                    ForEach(alphabets, id: \.self) { alphabet in
                        Text(alphabet)
                    }
                    .onMove { fromOffsets, toOffset in
                        alphabets.move(fromOffsets: fromOffsets, toOffset: toOffset)
                    }
                }
                Section("numbers") {
                    ForEach(numbers, id: \.self) { number in
                        Text(number)
                    }
                    .onMove { fromOffsets, toOffset in
                        numbers.move(fromOffsets: fromOffsets, toOffset: toOffset)
                    }
                }
            }
        }
    }
}

struct ListDragBetweenSections_Previews: PreviewProvider {
    static var previews: some View {
        ListDragBetweenSections()
    }
}
