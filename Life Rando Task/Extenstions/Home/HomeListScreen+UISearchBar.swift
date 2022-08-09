//
//  HomeListScreen+UISearchBar.swift
//  Life Rando Task
//
//  Created by KarimAhmed on 09/08/2022.
//

import Foundation
import UIKit

extension HomeListScreen: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.searchObjects(searchText: searchText)
        self.tableView.reloadData()
    }
}
