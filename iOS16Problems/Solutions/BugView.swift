//
//  BugView.swift
//  iOS16Problems
//
//  Created by AlelinApps on 9/24/22.
//

import SwiftUI

struct BugView: View {
    var body: some View {
        VStack {
            List {
                NavigationLink("Link in List", destination:   Text("Link in List") )
            }
            Spacer()
            NavigationLink("Link outside", destination:   Text("Link outside") )
        }
    }
}

struct BugView_Previews: PreviewProvider {
    static var previews: some View {
        BugView()
    }
}
