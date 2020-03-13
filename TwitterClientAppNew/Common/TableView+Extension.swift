//
//  TableView+Extension.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 13/03/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(_ className: T.Type,indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
    
    func registerNib<T: UITableViewCell>(_ className: T.Type) where T: Reusable {
        register(UINib.init(nibName: T.identifier, bundle: nil), forCellReuseIdentifier: T.identifier)
    }
}
