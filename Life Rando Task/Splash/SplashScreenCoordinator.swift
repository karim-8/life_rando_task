//
//  SplashCoordinator.swift
//  Life Rando Task
//
//  Created by KarimAhmed on 09/08/2022.
//

import UIKit

protocol CoordinatorProtocol {
    func navigateTo(view: UIViewController)
}

class SplashScreenCoordinator: CoordinatorProtocol {
    
    //MARK:- PROPERTIES
    let homeCoordinator = ListHomeViewCoordinator()
    
    //MARK:- NAVIGATE TO
    func navigateTo(view: UIViewController) {
        let viewModel: ListHomeViewModel = ListHomeViewModel(coordinator: homeCoordinator)
        
        
        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home") as? ListHomeScreen
        
        homeViewController?.viewModel =  viewModel
        
        
        if let vc = homeViewController {
            let navigationController = UINavigationController(rootViewController:  vc)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.modalTransitionStyle = .crossDissolve
            view.present(navigationController, animated: true, completion: nil)
        }
    }
}

