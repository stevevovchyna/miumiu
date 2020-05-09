//
//  UIViewController + NavigationItems.swift
//  miumiu
//
//  Created by Steven Vovchyna on 09.05.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

extension UIViewController {
    func addRightButtonToNavigationBar(with view: UIView) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: view)
    }

    func addLeftButtonToNavigationBar(with view: UIView) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
    }

    func setItemForNavigationBar(button: UIButton) -> UIView{
        let view = UIView()
        view.addSubview(button)
        view.frame = button.bounds
        return view
    }
}
