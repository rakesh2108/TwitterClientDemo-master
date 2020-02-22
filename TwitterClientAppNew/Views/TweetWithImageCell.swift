//
//  TweetWithImageCell.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 05/02/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//

import UIKit

final class TweetWithImageCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak private var profileImageView: UIImageView!
    @IBOutlet weak private var fullNameLabel: UILabel!
    @IBOutlet weak private var handleAndCreatedAtLabel: UILabel!
    @IBOutlet weak private var tweetTextLabel: UILabel!
    @IBOutlet weak private var tweetImageView: UIImageView!
   
    private var tweetsCellViewModel = TweetsCellViewModel()
    
    //MARK: Cell Life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.profileImageView.image = nil
        self.tweetImageView.image = nil
    }
    
    //MARK: Methods
    func updateUI(tweet: Status,media: PurpleMedia) {
        
        setProfileImage(tweet: tweet)
        tweetTextLabel.text = tweet.text
        fullNameLabel.text = tweet.user?.name
        if let screenName = tweet.user?.screenName {
            handleAndCreatedAtLabel.text = "@"+screenName
        }
        setTweetImage(media: media)
        
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
 
    private func setTweetImage(media: PurpleMedia) {
        if let mediaUrlString = media.mediaURLHTTPS , let url = URL(string: mediaUrlString) {
            tweetsCellViewModel.downloadImageForTweets(imgeURL: url) { [weak self] (image, error) in
                if error == nil {
                    DispatchQueue.main.async {
                        self?.tweetImageView.layer.cornerRadius = 10
                        self?.tweetImageView.image = image
                    }
                }
            }
        }
    }
    
}

extension TweetWithImageCell: Reusable{}
