//
//  StickyHeader.swift
//  StickyHeader
//
//  Created by Raphael Cerqueira on 05/11/21.
//

import SwiftUI

public struct StickyHeader<Content: View>: View {
    var height: CGFloat
    var content: Content
    
    public init(height: CGFloat = 180, @ViewBuilder content: () -> Content) {
        self.height = height
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { geo in
            if geo.frame(in: .global).minY > 0 {
                content
                    .offset(y: -geo.frame(in: .global).minY)
                    .frame(width: geo.size.width, height: geo.size.height + geo.frame(in: .global).minY)
            } else {
                content
                    .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .frame(height: height)
    }
}
