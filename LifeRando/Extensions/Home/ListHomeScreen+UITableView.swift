//
//  ListHomeScreen+UITableView.swift
//  LifeRando
//
//  Created by KarimAhmed on 09/08/22.
//

import Foundation
import UIKit

extension ListHomeScreen:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.searched.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as? RestaurantCell
        cell?.viewModel = viewModel?.viewModelForCell(at: indexPath.row)
        cell?.configure()
        return cell ?? UITableViewCell()
    }
}
