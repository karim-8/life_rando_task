//
//  ListHomeScreen.swift
//  LifeRando
//
//  Created by KarimAhmed on 09/08/22.
//

import UIKit

class ListHomeScreen: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var viewModel:ListHomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Restaurants"
        tableView.register(UINib(nibName: "RestaurantCell", bundle: nil), forCellReuseIdentifier: "RestaurantCell")
        fetchRestaurants()
        let filter = UIBarButtonItem(image: UIImage(named: "search_adv"), style: .plain, target: self, action: #selector(advanceSearchClicked))
        filter.tintColor = .white
        self.navigationItem.rightBarButtonItem = filter
        searchBar.searchTextField.font = FontBook.regular.of(size: 14)
    }
    @objc func doneButtonClicked(_ sender: Any) {
        view.endEditing(true)
    }
    func fetchRestaurants() {
        viewModel?.fetchRestaurants()
        tableView.reloadData()
    }
    @objc func advanceSearchClicked(_ sender:Any) {
        viewModel?.showFilter(view: self)
    }
    deinit {
        viewModel = nil
    }
}
