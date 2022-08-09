//
//  ListHomeViewController.swift
//  Life Rando Task
//
//  Created by KarimAhmed on 09/08/2022.
//

import UIKit

class RestaurantCell: UITableViewCell {
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var minCost: UILabel!
    @IBOutlet weak var delCost: UILabel!
    @IBOutlet weak var delImage: UIImageView!

    
    var viewModel: ListCellHomeViewModel?
    
    func configure() {
        selectionStyle = .none
        containView.setBorder(radius: 0, color: .lightGray)
        containView.clipsToBounds = true

        restaurantImage.image = UIImage(named: "food")
        name.text = viewModel?.name
        status.text = viewModel?.status
        rating.text = viewModel?.rating
        minCost.text = viewModel?.minCost
        delCost.text = viewModel?.delCost


        delCost.textColor  = (viewModel?.isDeliveryFree == true)  ? .systemGreen :.systemGray2
        delImage.tintColor = (viewModel?.isDeliveryFree == true) ? .systemGreen :.systemGray2
    }
}
