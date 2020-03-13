//
//  TweetsTableViewController.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 13/03/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//

import UIKit

final class TweetsTableViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak private var tweetsTableView: UITableView!
    @IBOutlet weak private var noTweetsView: UIView!
    
    //MARK: Properties
    private var searchController: UISearchController!
    private var activityIndicator: UIActivityIndicatorView!
    private var tweetsViewModel = TweetsViewModel()
    
    private var searchText: String? {
        didSet {
            guard let text = searchText else { return }
            searchController?.searchBar.text = text
            searchController?.searchBar.placeholder = text
            tweetsViewModel.tweets?.removeAll()
            tweetsViewModel.getTweets(searchText: text)
        }
    }
    
    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    //MARK: Methods
    private func setUpUI() {
        
        tweetsViewModel.performTwitterAuth()
        self.navigationController?.isNavigationBarHidden = false
        setupSearchController()
        setUpFooterViewForTableView()
        registerTableViewCell()
        tweetsViewModel.delegate = self
        tweetsTableView.isHidden = true
        noTweetsView.isHidden = false
        handleTableViewPagination()
    }
    
    private func handleTableViewPagination() {
        while tweetsViewModel.index <= tweetsViewModel.limit {
            tweetsViewModel.tweetsCountsToShow.append(tweetsViewModel.index)
            tweetsViewModel.index = tweetsViewModel.index + 1
        }
    }
    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        if let textfield = searchController.searchBar.value(forKey: Constants.searchField) as? UITextField {
            
            textfield.backgroundColor = UIColor.white
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
            
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.black
            }
            
        }
        searchController.searchBar.placeholder = Constants.searchTwitter
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.titleView = searchController.searchBar
        navigationItem.setHidesBackButton(true, animated: false)
        definesPresentationContext = true
    }
    
    private func registerTableViewCell() {
        tweetsTableView.registerNib(TweetWithImageCell.self)
        tweetsTableView.registerNib(TweetWithoutImageCell.self) 
    }
    
    private func setUpFooterViewForTableView() {
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tweetsTableView.bounds.width, height: CGFloat(44))
        tweetsTableView.tableFooterView = activityIndicator
    }
    
}

// MARK: - Table view data source
extension TweetsTableViewController: UITableViewDataSource {
    
    func tableView(_  tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetsViewModel.tweetsCountsToShow.count
    }
    
    func tableView(_  tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tweets = tweetsViewModel.tweets, indexPath.row < tweets.count - 1 else { return UITableViewCell() }
        if let media = tweets[indexPath.row].entities?.media {
            let tweetWithImageCell = tableView.dequeueReusableCell(TweetWithImageCell.self, indexPath: indexPath)
            tweetWithImageCell.updateUI(tweet: tweets[indexPath.row], media: media[0])
            return tweetWithImageCell
        } else {
            let tweetWithoutImageCell = tableView.dequeueReusableCell(TweetWithoutImageCell.self, indexPath: indexPath)
            tweetWithoutImageCell.updateUI(tweet: tweets[indexPath.row])
            return tweetWithoutImageCell
        }
        
    }
}

//MARK: Table View Delegate

extension TweetsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let totalTweets = tweetsViewModel.tweets, indexPath.row < totalTweets.count - 1 else { return }
        if indexPath.row == tweetsViewModel.tweetsCountsToShow.count - 1 {
            if tweetsViewModel.tweetsCountsToShow.count < totalTweets.count {
                tweetsTableView.tableFooterView?.isHidden = false
                activityIndicator.startAnimating()
                var index = tweetsViewModel.tweetsCountsToShow.count
                if index != 100{
                    tweetsViewModel.limit = index + 10
                }
                while index < tweetsViewModel.limit {
                    tweetsViewModel.tweetsCountsToShow.append(index)
                    index = index + 1
                }
                self.perform(#selector(reloadTableView), with: nil, afterDelay: 1.0)
            }
        }
    }
    
    @objc private func reloadTableView() {
        activityIndicator.stopAnimating()
        tweetsTableView.tableFooterView?.isHidden = true
        self.tweetsTableView.reloadData()
    }
}

//MARK: SearchBarDelegate
extension TweetsTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar == searchController.searchBar,let text = searchBar.text {
            searchText = text
            tweetsTableView.setContentOffset(.zero, animated: true)
            searchController.isActive = false
        }
    }
}

//MARK: ViewModelDelegate

extension TweetsTableViewController: TweetsViewModelDelegate {
    func fetchTweetsSuccess() {
        tweetsTableView.isHidden = false
        noTweetsView.isHidden = true
        tweetsTableView.reloadData()
    }
    
    func fetchTweetsFailure(error: String?) {
        tweetsTableView.isHidden = true
        noTweetsView.isHidden = false
    }
}
