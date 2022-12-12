//
//  FruitContentView.swift
//  iOS16Problems
//
//  Created by Bryan on 9/28/22.
//

import SwiftUI

struct FruitContentView: View {
    @StateObject private var fruitViewController = FruitViewController()
    
    var body: some View {
        NavigationStack(path: $fruitViewController.visibilityStack) {
            VStack {
                Button("Pile Banana and Strawberry", action: bananaAndStrawberry)
                    .padding(40)
                List(fruitViewController.fruitList) {
                    fruit in NavigationLink(value: fruit) {
                        Text(fruit.id)
                    }
                }
            }
            .navigationDestination(for: Fruit.self) {
                    fruit in FruitView(fruitViewController: fruitViewController, fruit: fruit)
            }
        }
    }
    
    func bananaAndStrawberry() {
        fruitViewController.bananaAndStrawberry()
    }
}

struct FruitView: View {
    // the state that will change and not be initialised
    @State private var showMoreText = false
    @ObservedObject var fruitViewController: FruitViewController
    var fruit: Fruit
    
    var body: some View {
        Text("Selected fruit: " + fruit.id)
        if (showMoreText) {
            Text("The text should disappear when moving to another fruit")
            HStack(spacing: 10) {
                ForEach(fruitViewController.fruitList) {
                    aFruit in Button(aFruit.id) {
                        fruitViewController.openView(fruit: aFruit)
                    }
                }
            }
        } else {
            Button("Show other fruits", action: showButtons)
        }
    }
    
    // let's change the state
    func showButtons() {
        showMoreText = true
    }
}

class Fruit : Hashable, Identifiable {
    // to conform to Identifiable
    var id: String
    
    init(name: String) {
        self.id = name
    }
    
    // to conform to Hashable which inherit from Equatable
    static func == (lhs: Fruit, rhs: Fruit) -> Bool {
        return (lhs.id == rhs.id)
    }
    
    // to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class FruitViewController: ObservableObject {
    @Published var visibilityStack : [Fruit] = []
    @Published var fruitList = [Fruit(name: "Banana"), Fruit(name: "Strawberry"), Fruit(name: "Pineapple")]

    // the functions that programatically call a 'new' view
    func openView(fruit: Fruit) {
        visibilityStack.removeAll()
        visibilityStack.append(fruit)
//        visibilityStack[0] = fruit    // has the same effect
    }
    
    // another one giving an example of what could be a deep link
    func bananaAndStrawberry() {
        visibilityStack.append(fruitList[0])
        visibilityStack.append(fruitList[1])
    }
}

struct FruitContentView_Previews: PreviewProvider {
    static var previews: some View {
        FruitContentView()
    }
}
