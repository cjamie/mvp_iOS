//
//  StarwarsCharacterRetriever.swift
//  mvp_iOS
//
//  Created by Jamie Chu on 9/9/20.
//  Copyright © 2020 Jamie Chu. All rights reserved.
//

import Foundation

typealias StarwarsCharacterCallback = (StarwarsCharacter) -> Void

protocol StarwarsCharacterRetriever {
    func get(_ characterId: Int, completion: @escaping StarwarsCharacterCallback)
}

final class NetworkService: StarwarsCharacterRetriever {
    
    func get(_ characterId: Int, completion: @escaping StarwarsCharacterCallback) {
        
        guard let url = URL(string: "https://swapi.dev/api/people/\(characterId)/") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data, let character = try? Self.jsonDecoder.decode(StarwarsCharacter.self, from: data) else {
                return
            }

            Self.dispatch { completion(character) }
        }.resume()
    }
    
    private static let jsonDecoder = JSONDecoder()
    
    private static func dispatch(block: @escaping(()->Void)){
        DispatchQueue.main.async(execute: block)
    }
}
