//
//  DataFetcher.swift
//  iOSApp
//
//  Created by Johny Kumar on 07/08/22.
//

import Foundation

//SOLID single responsibility principle we can use DataFetcher for fetching data offline/online(from API)
//change it to use case
class DataFetcher {
    //static let shared = DataFetcher()
    //currently we have onyl restaurant we can later on make it generic also for common use
    public func fetchProducts() -> [RestaurantDetails]{
        let fileReader = FileReader()
        let root:BaseDataModel = fileReader.readFile(fileName: "sample.json")
        return root.restaurants
    }
}
