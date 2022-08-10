//
//  ListHomeViewModel.swift
//  LifeRando
//
//  Created by KarimAhmed on 09/08/22.
//

import Foundation
import UIKit

//ListHomeViewModel for fetching restaurants
class ListHomeViewModel {
    var restaurants :[RestaurantDetails] = []
    var filtered :[RestaurantDetails] = []
    var searched :[RestaurantDetails] = []
    var isFilterApplied = false
    var searchText = ""
    private var coordinator: ListHomeViewCoordinator?

    //MARK:- INIT
    init(coordinator: ListHomeViewCoordinator) {
        self.coordinator = coordinator
    }
    
    func fetchRestaurants() {
        let objects = DataFetcher.shared.fetchProducts()
        let restaurants = objects.sorted(by:{
            if $0.status == $1.status {
                return $0.sortingValues.bestMatch > $1.sortingValues.bestMatch
            } else {
                return $0.status <= $1.status
            }
        })
        self.restaurants = restaurants
        self.filtered = restaurants
        self.searched = restaurants
    }
    func searchObjects(searchText:String) {
        self.searchText = searchText
        applySearch()
    }
    func applySearch() {
        searched = filtered.filter({ (restaurant) -> Bool in
            if restaurant.name.lowercased().range(of: searchText.lowercased()) != nil {
                return true
            } else {
                return false
            }
        })
        if searchText.isEmpty {
            searched = filtered
        }
    }
    func showFilter(view:UIViewController) {
        self.coordinator?.navigateTo(objects: restaurants, view: view)
    }
    func viewModelForCell(at index: Int) -> ListCellHomeViewModel {
        return ListCellHomeViewModel(restaurant: searched[index])
    }
}
