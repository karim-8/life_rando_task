//
//  ListHomeViewCoordinator.swift
//  LifeRando
//
//  Created by KarimAhmed on 09/08/22.
//

import Foundation
import UIKit

class ListHomeViewCoordinator: CoordinatorProtocol,FilterCoordinatorProtocol {
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
    
    //MARK:- NAVIGATE TO
    func navigateTo(view: UIViewController) {
    }
    
}
