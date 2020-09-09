//
//  StarwarsPresenter.swift
//  mvp_iOS
//
//  Created by Jamie Chu on 9/9/20.
//  Copyright © 2020 Jamie Chu. All rights reserved.
//

import Foundation

/*
    PRESENTER: - this class is responsible for ALL logic, including user actions, and UI updates (via delegation)
    This actor can be aware of the Model (StarwarsCharacter)
    This file SHALL BE UIKit Agnostic
    
*/
protocol StarwarsPresenterDelegate: class {
    func starwarsPresenter(_ presenter: StarwarsPresenter, userDidRetrieve characterName: String)
    func starwarsPresenter(_ presenter: StarwarsPresenter, userDidFailToSupplyNumberInput badInput: String)
}

final class StarwarsPresenter {
    
    weak var delegate: StarwarsPresenterDelegate?
    private let retriever: StarwarsCharacterRetriever
    
    init(retriever: StarwarsCharacterRetriever) {
        self.retriever = retriever
    }
    
    func presentCharacterWith(userInput: String) {
        if let numberInput = Int(userInput) {
            retriever.get(numberInput) { [weak self] starwarsCharacter in
                guard let self = self else { return }
                self.delegate?.starwarsPresenter(self, userDidRetrieve: starwarsCharacter.name)
            }
        } else {
            delegate?.starwarsPresenter(self, userDidFailToSupplyNumberInput: userInput)
        }
    }
}
