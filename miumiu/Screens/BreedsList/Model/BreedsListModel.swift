//
//  BreedsListModel.swift
//  miumiu
//
//  Created by Steven Vovchyna on 18.04.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

class BreedListTableViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {
    var breedsList: [Breed] = []
    var delegate: BreedCardDelegate?
    
    init(breedsList: [Breed]) {
        self.breedsList = breedsList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breedsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "breedCell",
            for: indexPath)
            as! BreedTableViewCell
        let data = breedsList[indexPath.row]
        cell.name.text = data.name
        cell.age.text = "\(data.life_span ?? "Couple") years "
        let isMetric = Locale.autoupdatingCurrent.usesMetricSystem
        let weight = isMetric ? (data.weight?.metric, "kgs") : (data.weight?.imperial, "lbs")
        cell.weight.text = "\(weight.0 ?? "Some") \(weight.1)"
        cell.country.text = getFlagEmojiFromCountryCode(country: data.country_code ?? "🐈")
        cell.temperament.text = data.temperament
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.delegate?.openBreedCard(breed: breedsList[indexPath.row])
    }

}
