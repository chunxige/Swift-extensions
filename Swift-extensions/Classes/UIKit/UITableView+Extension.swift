//
//  UITableView+Extensions.swift
//  Pods-Swift-extensions_Example
//
//  Created by chunxi on 2019/2/19.
//

import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: String(describing: T.self))
    }
    
    func register<T: UITableViewCell>(_ nib: UINib? = UINib(nibName: String(describing: T.self), bundle: nil), cellClass: T.Type) {
        register(nib, forCellReuseIdentifier: String(describing: T.self))
    }
    
    func register<T: UITableViewHeaderFooterView>(_ viewClass: T.Type) {
        register(viewClass, forHeaderFooterViewReuseIdentifier: String(describing: T.self))
    }
    
    func register<T: UITableViewHeaderFooterView>(_ nib: UINib? = UINib(nibName: String(describing: T.self), bundle: nil), forHeaderFooterViewClass: T.Type) {
        register(nib, forHeaderFooterViewReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type) -> T {
        let cell = dequeueReusableCell(withIdentifier: String(describing: T.self))
        guard let cellType = cell as? T else {
            fatalError("Unable to dequeue:\(cellClass)")
        }
        return cellType
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type, indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath)
        guard let cellType = cell as? T else {
            fatalError("Unable to dequeue:\(cellClass)")
        }
        return cellType
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewClass: T.Type) -> T {
        let view = dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self))
        guard let viewType = view as? T else {
            fatalError("Unable to dequeue:\(viewClass)")
        }
        return viewType
    }
}
