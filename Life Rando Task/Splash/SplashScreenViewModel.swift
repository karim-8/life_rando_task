//
//  SplashViewModel.swift
//  Life Rando Task
//
//  Created by KarimAhmed on 09/08/2022.
//

import UIKit

class SplashScreenViewModel {
    //PROPERTIES
    private let coordinator: SplashScreenCoordinator
    private let viewController: UIViewController
    
    //MARK:- INIT
    init(coordinator: SplashScreenCoordinator, view: UIViewController) {
        self.coordinator = coordinator
        self.viewController = view
        navigateTo()
    }
    func navigateTo() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.coordinator.navigateTo(view: self.viewController)
        })
    }
}
