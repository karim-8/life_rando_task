//
//  HomeListCoordinator.swift
//  Life Rando Task
//
//  Created by KarimAhmed on 09/08/2022.
//

import UIKit

class HomeListViewCoordinator: CoordinatorProtocol,FilterCoordinatorProtocol {
    
    //MARK:- PROPERTIES
    private var coordiantor = FilterViewCoordinator()
    
    func navigateTo(objects: [RestaurantDetails], view: UIViewController) {
        let filterScreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "filter") as? FilterScreen
        let viewModel = FilterViewModel(objects: objects, coordinator: coordiantor)
        filterScreen?.viewModel = viewModel
        filterScreen?.coordinator = coordiantor
        if let confirmFilterProtocol = view as? FilterResultDelegate {
            filterScreen?.filterDelegate = confirmFilterProtocol
        }
        if let vc = filterScreen {
            view.present(vc, animated: true, completion: nil)
        }
    }
}

