//
//  ContentView.swift
//  week4-hw4-mykynk
//
//  Created by Muhammed Yusuf Kaynak on 17.10.2022.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    @State private var isSuccess = false
    @State private var showingAlert = false
    @State private var alertText = ""
    @ObservedObject var homeViewModel: HomeViewModel = HomeViewModel()
    var body: some View {
        NavigationView{
            
            
            ZStack{
                
                
                LinearGradient(colors: [Color(red: 1.3, green: 0.6, blue: 0.5),Color(red: 0.66, green: 0.992, blue: 0.9)], startPoint: .top, endPoint: .bottom).frame(height: 1000)
                
                VStack(alignment: .leading) {
                    Text("Myk Instagram").fontWeight(.black).foregroundColor(Color.white).font(.system(size: 60)).multilineTextAlignment(.leading)
                    Text("Welcome!").fontWeight(.bold).foregroundColor(Color.white).font(.system(size: 20)).multilineTextAlignment(.leading)
                    Spacer()
                        .frame(height: 80.0)
                    TextField("Email", text: $email).padding().background( RoundedRectangle(
                        cornerRadius: 10)
                        .foregroundColor(Color.white))
                    SecureField("Password", text: $password).padding().background( RoundedRectangle(
                        cornerRadius: 10)
                        .foregroundColor(Color.white))
                    
                    HStack{
                        Button(action: { login() }) {
                            Text("Sign in")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white).padding()
                            
                        }.alert(alertText, isPresented: $showingAlert ){
                            Button("OK", role: .cancel) { }
                        }
                        Button(action: {signUp()}){
                            Text("Sign Up")
                                .fontWeight(.medium)
                                .foregroundColor(Color.white).padding()
                        }.alert(alertText, isPresented: $showingAlert ){
                            Button("OK", role: .cancel) { }
                        }
                        
                    }
                }
                .padding()
                
            }
            
        }.navigate(to: MainPageView(email: email), when: $isSuccess).navigationViewStyle(.stack)
    }
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                alertText = error?.localizedDescription ?? ""
                showingAlert = true
                
             //   isSuccess = true
            } else {
                print("success")
                alertText = "Sign In Success"
                showingAlert = true
                isSuccess = true
                email = result?.user.email ?? ""

                
            }
        }
    }
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                alertText = error?.localizedDescription ?? ""
                showingAlert = true

            } else {
                print("success")
                alertText = "Sign Up Success!"
                showingAlert = true
                isSuccess = true
                email = authResult?.user.email ?? ""
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
