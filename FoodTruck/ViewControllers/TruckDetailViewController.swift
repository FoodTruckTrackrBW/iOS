//
//  TruckDetailViewController.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class TruckDetailViewController: UIViewController {

    var foodTruckApiController: FoodTruckApiController?
    var truckDetails: TruckDetails?
    
    @IBOutlet weak var truckNameLabel: UILabel!
    @IBOutlet weak var truckImageView: UIImageView!
    @IBOutlet weak var typeOfCusineLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func locationButtonTapped(_ sender: UIButton) {
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuDetailShowSegue" {
            guard let destination = segue.destination as? MenuCollectionViewController else { return }
            
        } else if segue.identifier == "MapViewShowSegue" {
            guard let destination = segue.destination as? MapViewController else { return }
            
        }
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
        if let truck = truckDetails {
            truckNameLabel.text = truck.truckName
            truckNameLabel.textColor = .white
            truckNameLabel.adjustsFontSizeToFitWidth = true
            typeOfCusineLabel.text = truck.cuisineType
            
            do {
                guard let url = URL(string: truck.truckImage) else { return }
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                truckImageView.image = image
            } catch {
                print(error)
            }
        }
    }
}
