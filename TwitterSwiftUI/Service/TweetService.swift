//
//  TweetService.swift
//  TwitterSwiftUI
//
//  Created by wizz on 9/4/22.
//

import Firebase


struct TweetService {
    func uploadText(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["uid": uid, "caption": caption, "likes":0, "timestamp": Timestamp(date: Date())] as [String : Any]
        Firestore.firestore().collection("tweets")
            .document().setData(data){ error in
                print("DEBUG: Did upload tweet...")
                if let error = error {
                    print("DEBUG: Failed to upload tweet with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchTweets(completion: @escaping ([Tweet]) -> Void){
        Firestore.firestore().collection("tweets").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self)})
            completion(tweets)
        }
    }
}

