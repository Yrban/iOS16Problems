//
//  readSize.swift
//  iOS15Problems
//
//  Created by Developer on 1/5/22.
//

import SwiftUI

extension View {
    @warn_unqualified_access
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
            .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
    
    @warn_unqualified_access
    func copySize(to binding: Binding<CGSize>) -> some View {
        self.readSize { size in
            binding.wrappedValue = size
        }
    }

}

fileprivate struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

extension View {
    @warn_unqualified_access
    func readFrame(in space: CoordinateSpace, onChange: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: FrameInPreferenceKey.self, value: geometryProxy.frame(in: space))
            }
        )
            .onPreferenceChange(FrameInPreferenceKey.self, perform: onChange)
    }
    
    @warn_unqualified_access
    func copyFrame(in space: CoordinateSpace, to binding: Binding<CGRect>) -> some View {
        self.readFrame(in: space) { frame in
            binding.wrappedValue = frame
        }
    }
}

fileprivate struct FrameInPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
}
