//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by wizz on 9/4/22.
//

import Foundation


class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadText(withCaption caption: String){
        service.uploadText(caption: caption) { success in
            if success {
              //dismiss screen
                self.didUploadTweet = true
            } else {
                //show error message
            }
        }
    }
}
