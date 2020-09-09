//
//  ViewController.swift
//  mvp_iOS
//
//  Created by Jamie Chu on 9/8/20.
//  Copyright © 2020 Jamie Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let retriever: StarwarsCharacterRetriever = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        retriever.get(1) { character in
            
        }
    }


}

struct StarwarsCharacter: Codable {
    let name: String
}

typealias StarwarsCharacterCallback = (StarwarsCharacter) -> Void

protocol StarwarsCharacterRetriever {
    func get(_ characterId: Int, completion: @escaping StarwarsCharacterCallback)
}

class NetworkService: StarwarsCharacterRetriever {

    func get(_ characterId: Int, completion: @escaping StarwarsCharacterCallback) {
        completion(.init(name: "hello"))
    }
    
}

