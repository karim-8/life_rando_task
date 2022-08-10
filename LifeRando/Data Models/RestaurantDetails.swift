//
//  Restaurant.swift
//  LifeRando
//
//  Created by KarimAhmed on 09/08/22.
//

import Foundation

// restaurant model class for loading restaurants
class RestaurantDetails:Codable {
    let id:String
    let name:String
    let status:SortOrder
    let sortingValues:SortingValues
}

class SortingValues:Codable {
    let bestMatch:Float
    let newest:Float
    let ratingAverage:Float
    let distance:Int64
    let popularity:Float
    let averageProductPrice:Int64
    let deliveryCosts:Int64
    let minCost:Int64
}
enum SortBy:String,CaseIterable {
    case bestMatch = "Best match"
    case newest = "Newest"
    case ratings = "Ratings"
    case distance = "Distance"
    case price = "Price"
}
enum SortOrder:String, Comparable, Codable {
    case open
    case orderAhead = "order ahead"
    case closed
    private var sortOrder: Int {
        switch self {
            case .open:
                return 0
            case .orderAhead:
                return 1
            case .closed:
                return 2
        }
    }
    static func ==(lhs: SortOrder, rhs: SortOrder) -> Bool {
        return lhs.sortOrder == rhs.sortOrder
    }
    static func <(lhs: SortOrder, rhs: SortOrder) -> Bool {
       return lhs.sortOrder < rhs.sortOrder
    }
}
