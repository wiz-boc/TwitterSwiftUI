//
//  CustomInputField.swift
//  TwitterSwiftUI
//
//  Created by wizz on 7/23/22.
//

import SwiftUI

struct CustomInputField: View {
    var imageName: String
    var placeholder: String
    var isSecureField: Bool = false
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField {
                    SecureField(placeholder,text: $text)
                }
                else{
                    TextField(placeholder,text: $text)
                }
                    
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope", placeholder: "Email", text: .constant(""))
    }
}
