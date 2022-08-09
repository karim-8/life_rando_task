//
//  HomeListScreen+Filter.swift
//  Life Rando Task
//
//  Created by KarimAhmed on 09/08/2022.
//

import Foundation
import UIKit

extension HomeListScreen: FilterResultDelegate {
    
    func filterResult(restaurants: [RestaurantDetails],applyFilter:Bool) {
        viewModel?.filtered = restaurants
        viewModel?.isFilterApplied = applyFilter
        viewModel?.applySearch()
        tableView.reloadData()
    }
}
