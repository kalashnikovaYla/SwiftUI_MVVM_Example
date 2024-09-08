//
//  LoadingView.swift
//  SwiftUI_MVVM_Example
//
//  Created by Юлия  on 08.09.2024.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    
    let text: String
    
    var body: some View {
        VStack(spacing: 8) {
            ProgressView()
            Text(text)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(text: "Loading...")
            .preview(displayName: "Loading View")
    }
}
