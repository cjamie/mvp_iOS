//
//  StarwarsCharacterControllerTemplate.swift
//  mvp_iOS
//
//  Created by Jamie Chu on 9/9/20.
//  Copyright © 2020 Jamie Chu. All rights reserved.
//

import UIKit

// NOTE: - this is the VIEW component, but putting all of the setup code in this separate template class so we can make the delegate relationship with its parent explicit, and hide setup code (refer to StarwarsCharacterController)

class StarwarsCharacterControllerTemplate: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    let nameLabel: UILabel = {
        let namelabel = UILabel()
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        namelabel.text = "{ Name Label }"
        return namelabel
    }()

    private let presenter: StarwarsPresenter

    
    // MARK: - Init
    
    init(presenter: StarwarsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Storyboard are a pain!")
    }
    
    // MARK: - Helpers

    private func setupViews() {
        view.backgroundColor = .blue

        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap me to select ID", for: .normal)
        button.addTarget(self, action: #selector(didTapSelectIdButton), for: .touchUpInside)
        button.backgroundColor = .cyan
        button.setTitleColor(.blue, for: .normal)


        view.addSubviews([button, nameLabel])
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -32),
            nameLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
        ])
    }
    
    @objc private func didTapSelectIdButton() {
        let alert = UIAlertController(title: "Input Id", message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(
            .init(title: "OK", style: .default) { _ in
                guard let userInput = alert.textFields?.first?.text else { return }
                // the presenter shall handle user interaction
                self.presenter.presentCharacterWith(userInput: userInput)
            }
        )
        
        present(alert, animated: true, completion: nil)
    }
}
