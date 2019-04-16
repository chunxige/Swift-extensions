//
//  UICollectionView+Extension.swift
//  Pods-Swift-extensions_Example
//
//  Created by chunxi on 2019/4/16.
//

import Foundation

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    func register<T: UITableViewCell>(_ nib: UINib? = UINib(nibName: String(describing: T.self), bundle: nil), cellClass: T.Type) {
        register(nib, forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    func register<T: UICollectionReusableView>(_ headerFooterClass: T.Type, forSupplementaryViewOfKind kind: String) {
        register(headerFooterClass,
                 forSupplementaryViewOfKind: kind,
                 withReuseIdentifier: String(describing: T.self))
    }
    
    func register<T: UICollectionReusableView>(_ nib: UINib? = UINib(nibName: String(describing: T.self), bundle: nil), headerFooterClassOfNib headerFooterClass: T.Type, forSupplementaryViewOfKind kind: String) {
        register(nib,
                 forSupplementaryViewOfKind: kind,
                 withReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Unable to dequeue \(String(describing: cellClass)) with reuseId of \(String(describing: T.self))")
        }
        return cell
    }
    
    func dequeueReusableHeaderView<T: UICollectionReusableView>(_ viewClass: T.Type, for indexPath: IndexPath) -> T {
        let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: T.self), for: indexPath)
        guard let viewType = view as? T else {
            fatalError("Unable to dequeue \(String(describing: viewClass)) with reuseId of \(String(describing: T.self))")
        }
        return viewType
    }
    
    func dequeueReusableFooterView<T: UICollectionReusableView>(_ viewClass: T.Type, for indexPath: IndexPath) -> T {
        let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: T.self), for: indexPath)
        guard let viewType = view as? T else {
            fatalError("Unable to dequeue \(String(describing: viewClass)) with reuseId of \(String(describing: T.self))")
        }
        return viewType
    }

}
