//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by wizz on 7/23/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    private var tempUserSession: FirebaseAuth.User?
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempUserSession = user
            //self.userSession = user
            
            let data = ["email":email, "username": username.lowercased(),"fullname":fullname,"uid":user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid).setData(data) { _ in
                    print("DEBUG: Did upload user data...")
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut(){
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else { return }
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": profileImageUrl]) { _ in
                self.userSession = self.tempUserSession
            }
        }
    }
}
