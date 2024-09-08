//
//  QuotesScreen.swift
//  SwiftUI_MVVM_Example
//
//  Created by Юлия  on 08.09.2024.
//

import Foundation
import SwiftUI

struct QuotesScreen: View {
    
    ///@StateObject  - не перерисуется и не пересоздасться - обьекы StateObject сохраняют тоже состояние, и предотвращают потерю каких либо данных
    @StateObject private var vm = QuotesViewModelImpl(
        service: QuotesServiceImpl()
    )
    
    var body: some View {
        
        Group {
            
            if vm.quotes.isEmpty {
                
                LoadingView(text: "Fetching Quotes...")
                
            } else {
                
                List {
                    ForEach(vm.quotes, id: \.anime) { item in
                        QuoteView(item: item)
                    }
                }
            }
        }
        ///- .task — это модификатор, который позволяет вам выполнить асинхронный код связанным с жизненным циклом текущего представления. Он запускает свою замыкание выполнения, когда это представление появляется на экране.
        ///await vm.getAllQuotes() — это вызов метода getAllQuotes() из модели представления (vm), который является асинхронным. Использование await перед вызовом метода указывает на то, что выполнение кода должно подождать завершения этого асинхронного вызова, прежде чем продолжить выполнение.
        .task {
            ///хотим дождаться и получить случайные кавычки 
            await vm.getAllQuotes()
        }
    }
}


