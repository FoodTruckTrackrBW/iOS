//
//  FoodTruckListViewController.swift
//  FoodTruck
//
//  Created by Stephanie Ballard on 4/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class FoodTruckListViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let foodTruckApiController = FoodTruckApiController()
    var truckDetails: TruckDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func updateViews() {
        
    }
    
}

extension FoodTruckListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodTruckApiController.truckDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TruckCell", for: indexPath) as? FoodTruckTableViewCell else { return UITableViewCell() }
        let trucks = foodTruckApiController.truckDetails[indexPath.row]
        cell.truck = trucks
        return cell
    }
}

extension FoodTruckListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else { return }
        foodTruckApiController.fetchTruckDetails { (result) in
            switch result {
            case .success(let truckDetail):
                print(truckDetail)
//                self.truckDetails = truckDetail
                DispatchQueue.main.async {
                    self.updateViews()
                }
            case .failure(let error):
                print("Error fetching trucks: \(error)")
            }
        }
    }
    
}
