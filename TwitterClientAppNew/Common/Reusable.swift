//
//  Reusable.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 22/02/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//

import UIKit

protocol Reusable: AnyObject {}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}
