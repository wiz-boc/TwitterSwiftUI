//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by wizz on 9/4/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
}


