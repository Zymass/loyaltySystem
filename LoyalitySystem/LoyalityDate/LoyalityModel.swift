//
//  LoyalityModel.swift
//  LoyalitySystem
//
//  Created by Филяев Илья on 08.10.2021.
//

import Foundation
import SwiftUI
import Firebase

class LoyalityDate:ObservableObject {
    @Published var name:String = ""
    @Published var email:String = ""
    @Published var bank:String = ""
    @Published var qrCode:String = ""

    func addUser() {
        let User = [
            "name":name,
            "email":email,
            "bank":bank,
            "qrCode":qrCode,

        ] as [String : Any]
        
        let docRef = Firestore.firestore().document("users/\(UUID().uuidString)")
        print("setting data")
        docRef.setData(User){ (error) in
            if let error = error {
                print("error = \(error)")
            } else {
                print("data uploaded successfully")
                self.name = ""
                self.email = ""
            }
        }
    }
}



class getCategoriesData : ObservableObject{
    
    @Published var datas = [User]()
    @Published var safeBank = 0
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("users").addSnapshotListener { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges{
                
                let id = i.document.documentID
                let name = i.document.get("name") as! String
                let email = i.document.get("email") as! String
                let bank = i.document.get("bank") as! Int
                self.safeBank = bank
                if email == "Ilyxa48ru@mail.ru" {
                self.datas.append(User(id: id, name: name, email: email, bank: bank))
                }else {
                    return
                }
            }
        }
    }
}

struct User : Identifiable {
    var id : String
    var name : String
    var email : String
    var bank : Int
}
