//
//  NavigationItem + Item.swift
//  miumiu
//
//  Created by Steven Vovchyna on 09.05.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

extension UINavigationItem{
    static func setTheButton(with image: UIImage, title: String, attribute: UISemanticContentAttribute) -> UIButton {
        let view = UIView()
        let button = UIButton(type: .system)
        button.semanticContentAttribute = attribute
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.setTitle(title, for: .normal)
        button.sizeToFit()
        view.addSubview(button)
        view.frame = button.bounds
        return button
    }
}

