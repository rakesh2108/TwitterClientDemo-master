//
//  TweetWithoutImageCell.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 05/02/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//

import UIKit

class TweetWithoutImageCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak private var profileImageView: UIImageView!
    @IBOutlet weak private var fullNameLabel: UILabel!
    @IBOutlet weak private var handleAndCreatedAtLabel: UILabel!
    @IBOutlet weak private var tweetTextLabel: UILabel!
    
    //MARK: Properties
    private var tweetsCellViewModel = TweetsCellViewModel()
    
    //MARK: Cell Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.profileImageView.image = nil
    }
    
    //MARK: Methods
    func updateUI(tweet: Status) {
        
        setProfileImage(tweet: tweet)
        tweetTextLabel.text = tweet.text
        fullNameLabel.text = tweet.user?.name
        if let screenName = tweet.user?.screenName {
            handleAndCreatedAtLabel.text = "@"+screenName
        }
        
    }
    
    private func setProfileImage(tweet: Status) {
        if let urlString = tweet.user?.profileImageURLHTTPS, let url = URL(string: urlString) {
            
            tweetsCellViewModel.downloadImageForTweets(imgeURL: url) { [weak self] (image, error) in
                if error == nil {
                    DispatchQueue.main.async {
                        self?.profileImageView.image = image
                    }
                }
                
            }
        }
    }
    
}

extension TweetWithoutImageCell: Reusable {}
