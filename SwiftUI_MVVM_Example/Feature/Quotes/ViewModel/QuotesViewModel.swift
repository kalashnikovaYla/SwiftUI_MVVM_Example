//
//  QuotesViewModel.swift
//  SwiftUI_MVVM_Example
//
//  Created by Юлия  on 08.09.2024.
//


import Foundation

protocol QuotesViewModel: ObservableObject {
    ///функция объявлена с ключевым словом async, что указывает на то, что она выполняется асинхронно. Это значит, что выполнение функции может приостанавливаться в процессе ожидания результата, не блокируя основной поток выполнения.
    func getAllQuotes() async
}

///нужно пометить свой класс или функкцию, которая взаимодействует с UI - @MainActor, для обновления в главном потоке
@MainActor
final class QuotesViewModelImpl: QuotesViewModel {
    
    ///даем возможность изменять этот массив только в рамках этого класса
    @Published private(set) var quotes: [Quote] = []
    
    private let service: QuotesService
    
    ///иньекция зависимостей через протокол
    init(service: QuotesService) {
        self.service = service
    }
    
    
    ///do: этот блок используется для обработки кода, который может бросить ошибку. В данном случае он используется, чтобы попытаться получить данные.
    ///try await: здесь происходит вызов асинхронного метода fetch() у объекта service. Ключевое слово try указывает, что метод может вызвать ошибку, и если это произойдет, управление перейдет в блок catch.
    ///catch: если во время выполнения try возникла ошибка, она будет перехвачена здесь, и мы просто выводим её в консоль с помощью print(error).
    func getAllQuotes() async {
        do {
            self.quotes = try await service.fetch()
        } catch {
            print(error)
        }
    }
}
