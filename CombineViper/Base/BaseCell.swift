//
//  BaseCell.swift
//  CombineViper
//
//  Created by ALi on 2021. 06. 20..
//

import UIKit
import UIKitExtensions
import Combine

open class BaseCell: UITableViewCell, CellFactoring, CancellableStore {
    
    public var disposeBag: [AnyCancellable] = .init()
    
    public func removeSubscriptions() {
        disposeBag.removeAll()
    }
}

public extension CellFactoring where Self: BaseCell {
    
    static func createCell(in tableView: UITableView, for indexPath: IndexPath) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reuseIdentifier, for: indexPath) as? Self else {
            fatalError("Cell \(String(describing: Self.self)) cannot be instantiated!")
        }
        
        cell.removeSubscriptions()
        return cell
    }
}
