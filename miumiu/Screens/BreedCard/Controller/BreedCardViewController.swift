//
//  BreedCardViewController.swift
//  miumiu
//
//  Created by Steven Vovchyna on 18.04.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

class BreedCardViewController: UIViewController {

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var breedTitle: UILabel!
    @IBOutlet weak var lifespanWeightCountryLabel: UILabel!
    @IBOutlet weak var breedDescription: UILabel!
    @IBOutlet weak var breedTemperament: UILabel!
    @IBOutlet weak var flagLabel: UILabel!
    
    @IBOutlet weak var lifespanEtcView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var temperamentView: UIView!
    @IBOutlet weak var wikipediaButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var generalViewTopConstraint: NSLayoutConstraint!
    
    var tableViewModel: BreedParametersTableViewModel?
    var collectionViewModel: BreedPerksCollectionViewModel?
    
    var breedData: Breed?
    var catImageHolder: UIImage = UIImage()
    
    let topInset = UIApplication.shared.windows.last?.safeAreaInsets.top
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
        self.generalViewTopConstraint.constant -= self.topInset ?? 0
    }
    
    private func setupViewsText() {
        self.catImage.image = catImageHolder
        self.breedTitle.text = breedData?.name
        let isMetric = Locale.autoupdatingCurrent.usesMetricSystem
        let weight = isMetric ? (breedData?.weight?.metric, "kgs") : (breedData?.weight?.imperial, "lbs")
        self.lifespanWeightCountryLabel.text = "\(self.breedData?.life_span ?? "Couple") years / \(weight.0 ?? "Some") \(weight.1)"
        self.flagLabel.text = getFlagEmojiFromCountryCode(country: self.breedData?.country_code ?? "🐈")
        self.breedDescription.text = breedData?.description
        self.breedTemperament.text = breedData?.temperament
    }

    private func formParametersArray(with array: Breed?) -> [(Int?, String)] {
        return [(array?.child_friendly, "child friendly"),
                (array?.dog_friendly, "dog friendly"),
                (array?.energy_level, "energy level"),
                (array?.grooming, "grooming"),
                (array?.health_issues, "health issues"),
                (array?.intelligence, "intelligence"),
                (array?.shedding_level, "shedding level"),
                (array?.social_needs, "social needs"),
                (array?.stranger_friendly, "stranger friendly"),
                (array?.vocalisation, "vocalisation"),
                (array?.adaptability, "adaptability"),
                (array?.affection_level, "affection level")]
    }
    
    private func setupTableData() {
        let parametersArray = self.formParametersArray(with: self.breedData)
        self.tableViewModel = BreedParametersTableViewModel(properties: parametersArray)
        self.tableView.register(UINib(nibName: "PropertyTableViewCell", bundle: nil), forCellReuseIdentifier: "propertyCell")
        self.tableView.delegate = self.tableViewModel
        self.tableView.dataSource = self.tableViewModel
    }
    
    private func setupCollectionData() {
        self.collectionViewModel = BreedPerksCollectionViewModel(data: self.breedData)
        self.collectionView.register(UINib(nibName: "PerksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "perkCell")
        self.collectionView.delegate = self.collectionViewModel
        self.collectionView.dataSource = self.collectionViewModel
        if self.collectionViewModel?.perksArray.isEmpty ?? true {
            self.collectionViewHeightConstraint.constant = 0
            self.collectionViewBottomConstraint.constant = 0
        }
    }
    
    private func applyShadows<T:UIView>(to view: T) {
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 2.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableData()
        self.setupCollectionData()
        self.applyShadows(to: self.lifespanEtcView)
        self.applyShadows(to: self.wikipediaButton)
        self.applyShadows(to: self.descriptionView)
        self.applyShadows(to: self.temperamentView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupViewsText()
        self.setupNavigationBar()
    }
    
    @IBAction func wikipediaButtonTapped(_ sender: UIButton) {
        self.goToURL(url: self.breedData?.wikipedia_url)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension BreedCardViewController {
    private func presentAlert() {
        let alert = UIAlertController(title: "Error", message: "Failed to follow the link", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func goToURL(url: String?) {
        if let urlDestination = URL.init(string: url ?? "") {
            UIApplication.shared.open(urlDestination)
        } else {
            self.presentAlert()
        }
    }
}

extension UIImageView {
    func setImageBasedOnBool(with value: Int?, for baseName: String) {
        let boolValue = value == 1 ? true : false
        switch boolValue {
        case true:
            self.image = UIImage(named: baseName)
        case false:
            self.image = #imageLiteral(resourceName: "paw")
        }
    }
}
