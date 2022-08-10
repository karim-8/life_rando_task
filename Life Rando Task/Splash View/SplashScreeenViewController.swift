//
//  ViewController.swift
//  Life Rando Task
//
//  Created by KarimAhmed on 09/08/2022.
//

import UIKit
import Cosmos

class SplashScreenViewController: UIViewController {

    
    //MARK:- PROPERTIES
    private var viewModel: SplashScreenViewModel?
    private var coordinator = SplashScreenCoordinator()
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setBackgroundColor()
    }
    
    //MARK:- SETUP VIEW
    private func setupView() {
        viewModel = SplashScreenViewModel(coordinator: coordinator, view: self)
    }
            
    //MARK:- SET BACKGROUND COLOR
    private func setBackgroundColor() {
        view.backgroundColor = .systemOrange
    }
        
    //MARK:- DEINIT
    deinit {
        viewModel = nil
    }
}




