//
//  FoodTruckTableViewCell.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class FoodTruckTableViewCell: UITableViewCell {

    @IBOutlet weak var truckName: UILabel!

    var truck: TruckDetails? {
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateViews() {
        guard let truck = truck else { return }
        truckName.text = truck.truckName
    }

}
