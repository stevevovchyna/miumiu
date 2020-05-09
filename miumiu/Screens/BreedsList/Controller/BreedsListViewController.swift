//
//  BreedsListViewController.swift
//  miumiu
//
//  Created by Steven Vovchyna on 18.04.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

protocol BreedCardDelegate {
    func openBreedCard(breed: Breed)
}

class BreedsListViewController: UIViewController, BreedCardDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var breedsList: [Breed] = []
    var tableDataModel: BreedListTableViewModel?
    let loaderView = LoaderView()
    let networking = NetworkingManager.shared
    
    private func setupDataModel() {
        DispatchQueue.main.async {
            self.tableDataModel = BreedListTableViewModel(breedsList: self.breedsList)
            self.tableView.register(UINib(nibName: "BreedTableViewCell", bundle: nil), forCellReuseIdentifier: "breedCell")
            self.tableView.delegate = self.tableDataModel
            self.tableView.dataSource = self.tableDataModel
            self.tableDataModel?.delegate = self
            self.tableView.reloadData()
        }
    }
    
    private func setBackgroundImage() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "котик") ?? UIImage())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
    }
    
    private func setupLoaderView() {
        loaderView.frame = UIScreen.main.bounds
        self.view.addSubview(loaderView)
        loaderView.startAnimation()
        loaderView.superview?.bringSubviewToFront(loaderView)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4, green: 0.6, blue: 1, alpha: 0.88)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupLoaderView()
        setupNavigationBar()
        self.networking.getBreedsList { result in
            switch result {
            case .success(let breeds):
                self.breedsList = breeds
                self.setupDataModel()
                self.loaderView.stopAnimation()
            case .failure: print("oshibka")
            }
        }
    }
    
    func openBreedCard(breed: Breed) {
        let vc = UIStoryboard(name: "BreedCardView", bundle: nil).instantiateViewController(withIdentifier: "BreedCard") as! BreedCardViewController
        vc.breedData = breed
        guard let breedID = breed.id else { return }
        self.setupLoaderView()
        self.networking.getBreedImageLink(breedID: breedID) { result in
            switch result {
            case .success(let url):
                self.networking.getBreedImage(url: url) { result in
                    self.loaderView.stopAnimation()
                    switch result {
                    case .success(let image):
                        DispatchQueue.main.async {
                            vc.catImageHolder = image
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    case .failure: print("image not loaded")
                    }
                }
            case .failure:
                self.loaderView.stopAnimation()
                print("no image")
            }
        }
        
    }
}
