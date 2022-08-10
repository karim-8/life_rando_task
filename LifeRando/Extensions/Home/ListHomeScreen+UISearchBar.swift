//
//  ListHomeScreen+UISearchBar.swift
//  LifeRando
//
//  Created by KarimAhmed on 09/08/22.
//

import Foundation
import UIKit

extension ListHomeScreen:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.searchObjects(searchText: searchText)
        self.tableView.reloadData()
    }
}
