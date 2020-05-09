//
//  BreedParametersTableViewModel.swift
//  miumiu
//
//  Created by Steven Vovchyna on 25.04.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

class BreedParametersTableViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {

    var properties: [(Int?, String)]
    
    init(properties: [(Int?, String)]) {
        self.properties = properties.filter { $0.0 != nil }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "propertyCell", for: indexPath) as! PropertyTableViewCell
        cell.parameterName.text = properties[indexPath.row].1
        let level = properties[indexPath.row].0 ?? 0
        for i in (level + 1)...6 {
            cell.circlesView.viewWithTag(i)?.backgroundColor = .clear
        }
        if level == 0 {
            for i in 1...5 {
                cell.circlesView.viewWithTag(i)?.backgroundColor = .lightGray
            }
        }
        return cell
    }
    
}
