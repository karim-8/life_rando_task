//
//  FilterHomeScreen.swift
//  Life Rando Task
//
//  Created by KarimAhmed on 09/08/2022.
//

import UIKit
import Cosmos

protocol FilterResultDelegate:AnyObject {
    func filterResult(restaurants:[RestaurantDetails],applyFilter:Bool)
}

class FilterHomeScreen: UIViewController {
    @IBOutlet weak var sortBy: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var cosmosView:CosmosView!

    weak var filterDelegate:FilterResultDelegate? = nil
    var pickerView :UIPickerView = UIPickerView()
    var viewModel:FilterViewModel?
    var coordinator: FilterViewCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        cosmosView.didTouchCosmos = { [weak self] rating in
            self?.refreshButton()
        }
    }
    func setupView() {
        sortBy.setBorder(radius: 2, color: .lightGray)
        sortBy.addRightView()
        configurePickerView()
        sortBy.text = SortBy.allCases.first?.rawValue
        refreshButton()
    }
    func refreshButton() {
        let resultTitle = viewModel?.resultTitle(sortBy: (self.sortBy.text ?? ""), rating: Float(cosmosView.rating))
        self.resultButton.setTitle(resultTitle, for: .normal)
    }
    @IBAction func closeClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func showResult(_ sender: Any) {
        let sortedValues = viewModel?.filterObjects(sortBy: sortBy.text ?? "",rating: Float(cosmosView.rating)) ?? []
        filterDelegate?.filterResult(restaurants: sortedValues,applyFilter: viewModel?.isFilterApplied ?? false)
        dismiss(animated: true)
    }
    deinit {
        viewModel = nil
    }
}
