//
//  ViewController.swift
//  mvp_iOS
//
//  Created by Jamie Chu on 9/8/20.
//  Copyright © 2020 Jamie Chu. All rights reserved.
//

import UIKit

/*
    VIEW: - in iOS, the ViewController is considered the view (even though it comes packaged with the Controller component).
 
    This actor SHOULD NOT be aware of the model
    This component should only interact with the PRESENTER
*/

// NOTE: - refer to StarwarsCharacterControllerTemplate for how the UI is set up
final class StarwarsCharacterController: StarwarsCharacterControllerTemplate, StarwarsPresenterDelegate {
    
    // MARK: - StarwarsPresenterDelegate
    
    func starwarsPresenter(_ presenter: StarwarsPresenter, userDidRetrieve characterName: String) {
        nameLabel.text = characterName
    }
    
    func starwarsPresenter(_ presenter: StarwarsPresenter, userDidFailToSupplyNumberInput badInput: String) {
        
        let alert: UIAlertController = {
            let alert = UIAlertController(title: "Invalid Input!!!", message: " \"\(badInput)\" is not a number. Please provide numeric input", preferredStyle: .alert)
            alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
            return alert
        }()
                
        present(alert, animated: true) {
            self.nameLabel.text = "Please try again!"
        }
    }
}

