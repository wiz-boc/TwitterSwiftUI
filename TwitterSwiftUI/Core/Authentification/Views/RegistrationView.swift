//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by wizz on 7/23/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $viewModel.didAuthenticateUser,label: { })
            AuthHeaderView(title: "Get started. \nCreate your account.")
            VStack(spacing: 40){
                CustomInputField(imageName: "envelope", placeholder: "Email", text: $email)
                CustomInputField(imageName: "person", placeholder: "Username", text: $username)
                CustomInputField(imageName: "person", placeholder: "Fullname", text: $fullname)
                CustomInputField(imageName: "lock", placeholder: "Password",isSecureField: true, text: $password)
            }
            .padding(32)
            
            Button{
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            Spacer()
            Button{
                dismiss()
            }label: {
                HStack{
                    Text("Already have an account?")
                        .font(.caption)
                    Text("Sign in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
