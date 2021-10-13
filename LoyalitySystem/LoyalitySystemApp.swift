//
//  LoyalitySystemApp.swift
//  LoyalitySystem
//
//  Created by Филяев Илья on 08.10.2021.
//

import SwiftUI
import Firebase

@main
struct LoyalitySystemApp: App {
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class Delegate : NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
