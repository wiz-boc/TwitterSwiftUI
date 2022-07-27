//
//  User.swift
//  TwitterSwiftUI
//
//  Created by wizz on 7/27/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable,Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    let uid: String
}
