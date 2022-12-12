//
//  TestViewModel.swift
//  iOS16Problems
//
//  Created by Bryan on 9/17/22.
//

import SwiftUI
import Combine

protocol ViewModelType: ObservableObject {
    associatedtype Input
    associatedtype State
    
    var state: State { get }
    func trigger(_ input: Input)
    
    var subscriptions: Set<AnyCancellable> { get }
}

class TestViewModel: ViewModelType {
    
    enum Input {
        case initialise
        case clearRating
    }
    
    enum State {
        case idle
        case testData(BagModel)
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    @Published var state = State.idle
    var bag: BagModel?
    
    var products: [ProductModel] = [.init(id: 101, title: "Product 1", rating: 0),
                                    .init(id: 102, title: "Product 2", rating: 0)]
    
    func trigger(_ input: Input) {
        switch input {
        case .initialise:
            bag = BagModel(products: products)
            state = .testData(bag!)
            
        case .clearRating:
            products = [.init(id: 101, title: "Product 1", rating: 0),
                        .init(id: 102, title: "Product 2", rating: 0)]
            bag?.products = products
            state = .testData(bag!)
        }
    }
    
}

extension TestViewModel {
    struct BagModel {
        var products: [ProductModel]
    }
    
    struct ProductModel: Identifiable, Equatable {
        var id: Int
        var title: String
        var rating: Int
    }
}


struct TestView: View {
    
    @StateObject var viewModel = TestViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .testData(let bags):
                VStack(alignment: .center, spacing: 20) {
                    ForEach(bags.products) { product in
                        Item(title: product.title, rating: product.rating)
                    }
                    
                    Button {
                        viewModel.trigger(.clearRating)
                    } label: {
                        Text("Clear Rating")
                    }
                    
                }
                
            default:
                EmptyView()
            }
        }.onAppear {
            viewModel.trigger(.initialise)
        }
    }
}

extension TestView {
    struct Item: View {
        
        var title: String
        @State var rating: Int
        
        var body: some View {
            Group {
                Text(title)
                RatingStarView(rating: $rating)
            }
        }
    }
}

struct RatingStarView: View {
    
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            TextField("Rating", value: $rating, format: .number)
                .padding()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
