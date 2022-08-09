//
//  FilterViewModel.swift
//  Life Rando Task
//
//  Created by KarimAhmed on 09/08/2022.
//

import Foundation


class FilterViewModel {
    var restaurants :[RestaurantDetails] = []
    var filtered :[RestaurantDetails] = []
    private var coordinator: FilterViewCoordinator?
    var isFilterApplied = false

    init(objects:[RestaurantDetails],coordinator: FilterViewCoordinator) {
        self.restaurants = objects
        self.filtered = self.restaurants
        self.coordinator = coordinator
    }
    func resultTitle(sortBy:String,rating:Float) -> String {
        let sortedValues = filterObjects(sortBy: sortBy,rating:rating)
        return "Show \(sortedValues.count) results"
    }
    //filter options and return result to view controller
    func filterObjects(sortBy:String,rating:Float) -> [RestaurantDetails]{
        var sorted:[RestaurantDetails] = []
        if let sortBy = SortBy(rawValue: sortBy) {
            switch sortBy {
            case .bestMatch:
                sorted = restaurants.sorted(by:{
                    return $0.status == $1.status ? $0.sortingValues.bestMatch > $1.sortingValues.bestMatch : $0.status <= $1.status
                })
//                sorted.forEach{ aw in print("status: \(aw.status) \(sortBy) \(aw.sortingValues.bestMatch)")}
            case .newest:
                sorted = restaurants.sorted(by:{
                    return $0.status == $1.status ? $0.sortingValues.newest > $1.sortingValues.newest : $0.status <= $1.status
                })
//                sorted.forEach{ aw in print("status: \(aw.status) \(sortBy) \(aw.sortingValues.newest)")}
            case .ratings:
                sorted = restaurants.sorted(by:{
                    return $0.status == $1.status ? $0.sortingValues.ratingAverage > $1.sortingValues.ratingAverage : $0.status <= $1.status
                })
//                sorted.forEach{ aw in print("status: \(aw.status) \(sortBy) \(aw.sortingValues.ratingAverage)")}
            case .distance:
                sorted = restaurants.sorted(by:{
                    return $0.status == $1.status ? $0.sortingValues.distance < $1.sortingValues.distance : $0.status <= $1.status
                })
//                sorted.forEach{ aw in print("status: \(aw.status) \(sortBy) \(aw.sortingValues.distance)")}
            case .price:
                sorted = restaurants.sorted(by:{
                    return $0.status == $1.status ? $0.sortingValues.averageProductPrice > $1.sortingValues.averageProductPrice : $0.status <= $1.status
                })
//                sorted.forEach{ aw in print("status: \(aw.status) \(sortBy) \(aw.sortingValues.averageProductPrice)")}
            }
        }
        isFilterApplied = sorted.count != restaurants.count
        return sorted.filter{$0.sortingValues.ratingAverage <= rating }
    }
}
