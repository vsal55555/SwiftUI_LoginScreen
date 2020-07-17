//
//  ContentView.swift
//  SwiftUI_LoginScreen
//
//  Created by BSAL-MAC on 5/25/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import SwiftUI
import Firebase

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @State var showAlert = false
    //@State var alertMessage = "something went wrong"
    //@EnvironmentObject private var userdata: UserData
    
    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("something went wrong")
                //self.alertMessage = error?.localizedDescription ?? ""
                //self.showAlert = true
            }else {
                    print("succesfull")
            }
        }
        
    }
    
    
    var body: some View {
        VStack {
            Text("Welcome Back!")
                .font(.system(size: 32, weight: .heavy))
                
            Text("Sign in to Continue")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.gray)
            
            VStack(spacing: 18) {
                TextField("Email Address", text: $email)
                    .keyboardType(.default)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.bg1, lineWidth: 1))
                    
                
                SecureField("Password", text: $password)
                .font(.system(size: 14))
                .padding(12)
                .keyboardType(.default)
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.bg1, lineWidth: 1))
               
                
            }
            .padding(.vertical, 64)
            
            Button(action: signIn){
                Text("Sign In")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors: [Color("bg1"), Color("bg2")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(5)
                    
            }
            if (error == ""){
                Text("Please enter username and password first.")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.red)
                .padding()
            }
            Spacer()
            
            NavigationLink(destination: SignUp()) {
                 Text("Create an account")
                                   .font(.system(size: 14, weight: .semibold))
                                   .foregroundColor(.bg1)
                                   .accessibility(identifier: "SignUp.next")
                /*     HStack {
                    Text("I'm a new user.")
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.black)
                } */
            
            }
        }
        .padding(.horizontal, 32)
    }
    
   
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            SignInView()
        }
    }
}

extension Color {
    static let bg1 = Color("bg1")
    static let bg2 = Color("bg2")
}

struct SignUp: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    
    func SignUp(){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("something went wrong")
            } else {
                print("Added new user")
            }
        }
    }
    var body: some View {
       
        VStack {
            Text("Welcome Back!")
                .font(.system(size: 32, weight: .heavy))
                
            Text("Sign Up to get started")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.gray)
            
            VStack(spacing: 18) {
                TextField("Email Address", text: $email)
                    .font(.system(size: 14))
                    .padding(12)
                    .keyboardType(.default)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.bg1, lineWidth: 1))
                .accessibility(identifier: "emailTF")
                
                SecureField("Password", text: $password)
                .font(.system(size: 14))
                .padding(12)
                .keyboardType(.default)
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.bg1, lineWidth: 1))
                 .accessibility(identifier: "passwordTF")
                
            }
            .padding(.vertical, 64)
            
            Button(action: SignUp){
                Text("Sign Up")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors: [Color("bg1"), Color("bg2")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(5)
                .accessibility(identifier: "signInbutton")
            }
            Spacer()
        }
        .padding(.horizontal, 32)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.previewLayout(.fixed(width: 375, height: 1000)) //iPhone 11 landscape size
    }
}

