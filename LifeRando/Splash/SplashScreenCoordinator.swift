//
//  SplashScreenCoordinator.swift
//  Glovo Task Prepartion
//
//  Created by KarimAhmed on 09/08/22.
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
        //Instantiate the storyboard
        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home") as? ListHomeScreen
        //Any related data to the view
        homeViewController?.viewModel =  viewModel
        
        //navigation proccess
        if let vc = homeViewController {
            let navigationController = UINavigationController(rootViewController:  vc)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.modalTransitionStyle = .crossDissolve
            view.present(navigationController, animated: true, completion: nil)
        }
    }
}
