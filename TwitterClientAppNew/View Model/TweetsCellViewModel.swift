//
//  TweetsCellViewModel.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 13/03/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//

import UIKit

final class TweetsCellViewModel {
    
    //MARK: Methods
    func downloadImageForTweets(imgeURL: URL, completionHandler handler : @escaping imageDownloadCompletionHandler) {
        NetworkManager.downloadImage(imageUrl: imgeURL) { (image, error) in
            handler(image, error)
        }
    }
}
