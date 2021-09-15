//
//  ContentView.swift
//  ListApp
//
//  Created by praneeth vithanage on 9/15/21.
//

import SwiftUI
import FBSDKLoginKit

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    // setting app Stroages
    
    @AppStorage("logged") var logged = false
    @AppStorage("email") var email = ""
    @State var manager = LoginManager()
    
    var body: some View {
        VStack(Spacing:25){
            // Login button
            Button(action:{
                //if logged means logging out
                if logged {
                    
                    manager.logOut()
                    email = ""
                    logged = false
                    
                } else {
                    // logging in users
                    // you can give any kind of permission
                    // reading profile and email
                    manager.logIn(permission:["public_profle","email"],from:nil){
                        (Result,err)in
                        if err != nil{
                            print(err!.localizedDescription)
                            return
                        }
                        // check => user cancelled the folw
                        
                        if !result!.isCancelled{
                            
                            // sucessfully logged
                            logged = true
                            // getting user data throught FB Graph
                            let request = GrapRequest(graphPath: "me", parameters :
                                                        ["feilds" : "email"])
                            
                            request.start {(_, res, _) in
                                // return as dictionary
                                guard let profileData = res as? [String : Any] else {return}
                                // saving email....
                                email = profileData["email"]as! String
                            }
                        }
                    }
                }
                
                
            },lable:{
                Text(logged ? "Logout" : "FB Login")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .padding(.horizontal,35)
                    .background(Color.blue)
                    .clipShape(Capsule())
            })
            
            Text(email)
                .fontWeight(.bold)
        }
        
        DataList()
    }
}
