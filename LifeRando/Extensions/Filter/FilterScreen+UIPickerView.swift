//
//  FilterScreen+UIPickerView.swift
//  LifeRando
//
//  Created by KarimAhmed on 09/08/22.
//

import Foundation
import UIKit

extension FilterScreen:UIPickerViewDelegate,UIPickerViewDataSource {
    func configurePickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self

        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.doneClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.doneClicked))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        sortBy.inputView = pickerView
        sortBy.inputAccessoryView = toolBar
    }
    @objc func doneClicked() {
        sortBy.resignFirstResponder()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return SortBy.allCases[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SortBy.allCases.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sortBy.text = SortBy.allCases[row].rawValue
        refreshButton()
    }
}
