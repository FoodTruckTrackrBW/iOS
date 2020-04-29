//
//  TruckDetailViewController.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class TruckDetailViewController: UIViewController {

    @IBOutlet weak var truckNameLabel: UILabel!
    @IBOutlet weak var truckImageView: UIImageView!
    @IBOutlet weak var typeOfCusineLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
}
