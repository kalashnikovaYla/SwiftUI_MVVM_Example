//
//  QuotesService.swift
//  SwiftUI_MVVM_Example
//
//  Created by Юлия  on 08.09.2024.
//

import Foundation

protocol QuotesService {
    func fetch() async throws -> [Quote]
}

final class QuotesServiceImpl: QuotesService {
    
    ///Асинхронный запрос к API.
    ///Используется оператор try, который позволяет выбрасывать ошибки, если, например, не удается получить данные.
    ///Оператор await указывает на то, что выполнение кода ожидает завершения асинхронной операции до продолжения.
    func fetch() async throws -> [Quote] {
        let urlSession = URLSession.shared
        guard let url = URL(string: APIConstants.baseUrl.appending("/api/quotes")) else {
            throw URLError(.badURL) // Обработка ошибки, если URL некорректен
        }
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let quotes = try JSONDecoder().decode([Quote].self, from: data)
            return quotes
        } catch {
            throw error // Перебрасываем пойманную ошибку
        }
    }
}
