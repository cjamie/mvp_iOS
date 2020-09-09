//
//  StarwarsCharacter.swift
//  mvp_iOS
//
//  Created by Jamie Chu on 9/9/20.
//  Copyright © 2020 Jamie Chu. All rights reserved.
//

import Foundation

// MODEL - This actor shall only interact directly with the presenter, NOT View

struct StarwarsCharacter: Codable {
    let name: String
}
