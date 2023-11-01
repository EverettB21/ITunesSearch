//
//  ItemInfoController.swift
//  iTunesSearch
//
//  Created by Everett Brothers on 10/24/23.
//

import Foundation
import UIKit

class ItemInfoController {
    enum ItemInfoError: Error, LocalizedError {
        case itemNotFound
    }
    
    func fetchItems(matching queryItems: [URLQueryItem]) async throws -> [ItemInfo] {
        let url = URL(string: "https://itunes.apple.com/search")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = queryItems
        
        let (data, response) = try await URLSession.shared.data(from: components.url!)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ItemInfoError.itemNotFound
        }
            
        let jsonDecoder = JSONDecoder()
        let result = try jsonDecoder.decode(Result.self, from: data)
        print("results count \(result.results.count)")
        return result.results
    }
}
