//
//  UIView+.swift
//  mvp_iOS
//
//  Created by Jamie Chu on 9/9/20.
//  Copyright © 2020 Jamie Chu. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach(addSubview)
    }
}
