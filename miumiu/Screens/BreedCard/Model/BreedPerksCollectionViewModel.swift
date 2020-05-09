//
//  BreedPerksCollectionViewModel.swift
//  miumiu
//
//  Created by Steven Vovchyna on 27.04.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

class BreedPerksCollectionViewModel: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var breedData: Breed?
    var perksArray: [(String, Bool)] = []
    
    private func formPerksArray(from data: Breed?) -> [(String, Bool)] {
        var array: [(String, Bool)] = []
        if data?.experimental == 1 {
            array.append(("experimental", true))
        }
        if data?.hairless == 1 {
            array.append(("hairless", true))
        }
        if data?.rare == 1 {
            array.append(("rare", true))
        }
        if data?.suppressed_tail == 1 {
            array.append(("suppress tail", true))
        }
        if data?.natural == 1 {
            array.append(("natural", true))
        }
        if data?.short_legs == 1 {
            array.append(("short legs", true))
        }
        if data?.hypoallergenic == 1 {
            array.append(("hypoallergenic", true))
        }
        return array
    }
    
    init(data: Breed?) {
        super.init()
        self.breedData = data
        self.perksArray = self.formPerksArray(from: data)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        perksArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "perkCell", for: indexPath) as! PerksCollectionViewCell
        cell.perkImage.image = UIImage(named: self.perksArray[indexPath.row].0)
        cell.perkName.text = self.perksArray[indexPath.row].0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
