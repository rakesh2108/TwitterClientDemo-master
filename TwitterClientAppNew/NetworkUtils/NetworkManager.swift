//
//  NetworkManager.swift
//  TwitterClientAppNew
//
//  Created by Rakesh Rayannavar on 13/03/20.
//  Copyright © 2020 Rakesh Rayannavar. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

typealias tweetsDataFetchCompletionHandler = (_ response: Data?,_ error: Error?) -> Void
typealias imageDownloadCompletionHandler = (_ image: UIImage?,_ error: Error?) -> Void

class NetworkManager {
    
    //MARK: Properties
    static let sessionManager = SessionManager()
    static let downloader = ImageDownloader()
    static var authToken = ""
    
    //MARK: Methods
    static func performAuthenticationToFetchToken() {
        guard let base64EncodedString = TwitterAccountCredentials.getBase64EncodedValue() else { return } 
        let authToken = "Basic" + " " + base64EncodedString
        let header = [URLConstant.authorization: authToken]
        let params = [URLConstant.grantType: URLConstant.client_credentials]
        NetworkManager.sessionManager.request(URLConstant.twitterAuthApi, method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                guard let resultData = response.result.value as? NSDictionary,let accessToken = resultData[URLConstant.access_token] as? String else { return }
                NetworkManager.authToken = "Bearer" + " " + accessToken
            }
        }
    }
    static func fetchTweets(searchText: String,handler: @escaping tweetsDataFetchCompletionHandler) {
        let header = [URLConstant.authorization: authToken]
        NetworkManager.sessionManager.request(URLConstant.searchTweetsApi, method: .get, parameters: ["q": searchText,"count": 100], encoding: URLEncoding.methodDependent, headers: header).responseJSON { (response) in
            handler(response.data, response.error)
        }
    }
    
    static func downloadImage(imageUrl: URL,handler: @escaping imageDownloadCompletionHandler) {
        let request = URLRequest(url: imageUrl)
        NetworkManager.downloader.download(request) { (response) in
            handler(response.result.value?.af_imageRounded(withCornerRadius: 10),response.error)
        }
    }
}

