//
//  View+Preview.swift
//  SwiftUI_MVVM_Example
//
//  Created by Юлия  on 08.09.2024.
//

import Foundation

import SwiftUI

struct PreviewComponentModifier: ViewModifier {
    
    let displayName: String
    
    func body(content: Content) -> some View {
        content
            .previewDisplayName(displayName)
            .previewLayout(.sizeThatFits)
    }
}

extension View {
    
    func preview(displayName: String = "") -> some View {
        self.modifier(PreviewComponentModifier(displayName: displayName))
    }
}
