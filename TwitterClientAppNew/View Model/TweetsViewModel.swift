//
//  TweetsViewModel.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 13/03/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//

import Foundation

protocol TweetsViewModelDelegate {
    func fetchTweetsSuccess()
    func fetchTweetsFailure(error: String?)
}

final class TweetsViewModel {
    
    //MARK: Properties
    var tweets: [Status]?
    var limit = 10
    var index = 0
    var tweetsCountsToShow = [Int]()
    var delegate: TweetsViewModelDelegate?
    
    //MARK:Methods
    
    func performTwitterAuth() {
         NetworkManager.performAuthenticationToFetchToken()
    }
    
    func getTweets(searchText: String) {
        NetworkManager.fetchTweets(searchText: searchText) { (data,error) in
            if let data = data,let tweets = try? JSONDecoder().decode(Tweets.self, from: data) {
                self.tweets = tweets.statuses
                self.delegate?.fetchTweetsSuccess()
            } else {
                self.delegate?.fetchTweetsFailure(error: error?.localizedDescription)
            }
        }
    }
    
}
