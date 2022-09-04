//
//  FeedViewModel.swift
//  TwitterSwiftUI
//
//  Created by wizz on 9/4/22.
//

import Foundation


class FeedViewModel: ObservableObject {
    let service = TweetService()
    @Published var tweets = [Tweet]()
    
    init(){
        fetchTweets()
    }
    
    func fetchTweets(){
        service.fetchTweets { tweets in
            self.tweets = tweets
        }
    }
}
