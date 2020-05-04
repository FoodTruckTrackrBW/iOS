//
//  FoodTruckListViewController.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class FoodTruckListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var foodTruckApiController: FoodTruckApiController? {
        didSet {
            foodTruckApiController?.fetchTruckDetails(completion: { _ in
                DispatchQueue.main.async {
                    print(self.foodTruckApiController?.truckDetails.first?.truckName)
                    self.tableView.reloadData()
                }
            })
        }
    }
    var truckDetails: TruckDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

//    indexPathForSelectedRow property on I think the table view in the prepare for segue function
//    So if segue.ident == “name of segue” {
//    Then guard let the destinationVC and let indexPath = tableView.indexPathForSelectedRow else { return}
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TruckDetailShowSegue" {
            guard let destinationVC = segue.destination as? TruckDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            destinationVC.truckDetails = foodTruckApiController?.truckDetails[indexPath.row]
        }
    }
    

    private func updateViews() {
        
    }
    
}

extension FoodTruckListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodTruckApiController?.truckDetails.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TruckCell", for: indexPath) as? FoodTruckTableViewCell else { return UITableViewCell() }
        let truck = foodTruckApiController?.truckDetails[indexPath.row]
        cell.truck = truck
        cell.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = truck?.truckName
//        cell.detailTextLabel?.text = truck?.cuisineType
//        if let urlString = truck?.truckImage, let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
//            DispatchQueue.main.async {
//                cell.imageView?.image = UIImage(data: data)
//            }
//        }
        return cell
    }
}

