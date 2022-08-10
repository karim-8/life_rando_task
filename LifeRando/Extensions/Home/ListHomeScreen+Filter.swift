//
//  ListHomeScreen+Filter.swift
//  LifeRando
//
//  Created by KarimAhmed on 09/08/22.
//

import Foundation
import UIKit

extension ListHomeScreen:FilterResultDelegate {
    func filterResult(restaurants: [RestaurantDetails],applyFilter:Bool) {
        viewModel?.filtered = restaurants
        viewModel?.isFilterApplied = applyFilter
        viewModel?.applySearch()
        tableView.reloadData()
    }
}
