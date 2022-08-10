//
//  ListCellHomeViewModel.swift
//  LifeRando
//
//  Created by KarimAhmed on 09/08/22.
//

import Foundation

class ListCellHomeViewModel {
    let name: String
    let status: String
    let rating: String
    let delCost: String
    let minCost: String
    let isDeliveryFree:Bool
    init(restaurant: RestaurantDetails) {
        name = restaurant.name
        status = restaurant.status.rawValue
        rating = "\(restaurant.sortingValues.ratingAverage)"
        minCost = "Min. \(restaurant.sortingValues.minCost) £"
        if restaurant.sortingValues.deliveryCosts != 0 {
            delCost = "\(restaurant.sortingValues.deliveryCosts) £"
            isDeliveryFree = false
        } else {
            delCost = "Free"
            isDeliveryFree = true
        }        
    }
}
