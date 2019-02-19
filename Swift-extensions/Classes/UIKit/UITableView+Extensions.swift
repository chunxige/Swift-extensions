//
//  UITableView+Extensions.swift
//  Pods-Swift-extensions_Example
//
//  Created by chunxi on 2019/2/19.
//

import UIKit

public extension UITableView {
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forHeaderFooterViewReuseIdentifier: String(describing: T.self))
    }
    
    func register<T: UITableViewHeaderFooterView>(_ viewClass: T.Type) {
        register(viewClass, forHeaderFooterViewReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type) -> T {
        let cell = dequeueReusableCell(withIdentifier: String(describing: T.self))
        guard let cellType = cell as? T else {
            fatalError("无法找到需要复用的UITableViewCell:\(cellClass)")
        }
        return cellType
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewClass: T.Type) -> T {
        let view = dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self))
        guard let viewType = view as? T else {
            fatalError("无法找到需要复用的UITableViewHeaderFooterView:\(viewClass)")
        }
        return viewType
    }
    
}
