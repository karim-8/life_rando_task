//
//  Extensions.swift
//  iOSApp
//
//  Created by Johny Kumar on 07/08/22.
//

import Foundation
import UIKit

//Extensions file for adding extensions in inbuild files.

extension UITextField {
    func addRightView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        let arrow = UIImageView(image: UIImage(named: "bottom_arrow"))
        if let size = arrow.image?.size {
            arrow.frame = CGRect(x: 0.0, y: 5.0, width: size.width, height: size.height)
        }
        arrow.contentMode = UIView.ContentMode.center
        arrow.center = view.center
        view.addSubview(arrow)
        self.rightView = view
        self.rightViewMode = UITextField.ViewMode.always
    }
}
//custom extension of uicomponents and foundations classes
//text field && image
extension UIView {
    func setBorder(radius:CGFloat,color:UIColor?, shadow:Bool = false, borderWidth:CGFloat = 0.5) {
        self.layer.borderColor = color?.cgColor ?? UIColor.gray.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = radius
        if shadow {
            self.layer.shadowOpacity = 0.4
            self.layer.shadowRadius = 1.0
            self.layer.shadowOffset = CGSize.zero // Use any CGSize
            self.layer.shadowColor = UIColor.gray.cgColor
        }
    }
}
//searching in arr
//extension Array where Element: Equatable {
//    func reorder(by preferredOrder: [Element]) -> [Element] {
//        return self.sorted { (a, b) -> Bool in
//            guard let first = preferredOrder.firstIndex(of: a) else {
//                return false
//            }
//            guard let second = preferredOrder.firstIndex(of: b) else {
//                return true
//            }
//            return first < second
//        }
//    }
//}
//FontBook for app branding
enum FontBook: String {
    case bold = "HelveticaNeue-Bold"
    case regular = "HelveticaNeue"
    func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}
extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
