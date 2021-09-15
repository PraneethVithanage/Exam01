//
//  LogingApp.swift
//  ListApp
//
//  Created by praneeth vithanage on 9/15/21.
//


import SwiftUI
import FBSDKLoginKit

@main
struct LoginApp:App {
    var body : some Scence{
        WindowGroup{
            ContentView()
                .onOpenURL(perform: { url in
                    
                    UIApplicationDelegate.shared.application(UIApplication.shared,open:
                        url, sourceAplication:nil,annotation:
                        UIApplication.OpenURLOptionsKey.annotation
                    )
                    
                    
                })
        }
    }
}
