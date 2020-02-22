//
//  TwitterCredentials.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 07/02/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//

import Foundation


struct TwitterAccountCredentials {
   
    static let consumerKey = "eiX5ENfwhGD6ijwPdPlVMoPXy"
    static let consumerSecret = "0V3C2VDs3AaY8IFQ45A585epCIwPJlKyKyUFkwGW13zx25cgg2"
    static let concatenatedKeyAndSecret = consumerKey+":"+consumerSecret
    static func getBase64EncodedValue() -> String? {
        return concatenatedKeyAndSecret.base64Encoded
    }
}


public extension String {
    
    var base64Encoded: String? {
        let utf8 = self.data(using: .utf8)
        let base64 = utf8?.base64EncodedString()
        return base64
    }

}
