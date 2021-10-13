//
//  LoyalityView.swift
//  LoyalitySystem
//
//  Created by Филяев Илья on 08.10.2021.
//

import SwiftUI
import Firebase

struct LoyalityView: View {
    @ObservedObject var model = LoyalityDate()
    @ObservedObject var date = getCategoriesData()
    var body: some View {
        VStack{
            TextField("Enter name", text: $model.name)
            TextField("Enter email", text: $model.email)
            Button("Add member", action: {model.addUser() })
            if date.datas.count != 0 {
                ForEach(date.datas){ i in
                    Text(String(date.safeBank))
                    Text(i.name)
                }
                }
            
        }
    }
}
struct LoyalityView_Previews: PreviewProvider {
    static var previews: some View {
        LoyalityView()
    }
}
