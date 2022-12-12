//
//  TextFieldClearing.swift
//  iOS16Problems
//
//  Created by Bryan on 10/3/22.
//

import SwiftUI

struct TextFieldClearing: View {
    @State private var value = Double.zero
    
    let percentFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .percent
        
        return formatter
    }()
    
    var body: some View {
        VStack {
            TextField("Enter Value", value: $value, format: .percent)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("Entered Value \(value).")
        }
    }
}

struct TextFieldClearing_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldClearing()
    }
}
