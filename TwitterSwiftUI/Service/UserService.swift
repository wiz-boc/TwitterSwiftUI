//
//  UserService.swift
//  TwitterSwiftUI
//
//  Created by wizz on 7/25/22.
//

import Firebase
import FirebaseFirestoreSwift
import Combine


struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                guard let snapshot = snapshot else { return }
                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
                    
            }
    }
}
