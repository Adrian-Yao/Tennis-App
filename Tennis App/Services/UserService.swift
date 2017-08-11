//
//  UserService.swift
//  Tennis App
//
//  Created by adyao20 on 8/3/17.
//  Copyright © 2017 adyao20. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase


struct UserService {
    
    static func show(forUID uid: String, completion: @escaping (User?) -> Void) {
        let ref = Database.database().reference().child("users").child(uid)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let user = User(snapshot: snapshot) else {
                return completion(nil)
            }
            
            completion(user)
        })
    }
    
    static func create(_ firUser: FIRUser, displayName: String, age: String, gender: String, level: String, country: String, city: String, phoneNumber: String, info: String, completion: @escaping (User?) -> Void) {
        
        let userAttrs = ["displayName":displayName, "age":age, "gender":gender, "level":level, "country":country, "city":city, "phoneNumber":phoneNumber, "info":info]
        
        let ref = Database.database().reference().child("users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                completion(user)
            })
        }
    }
}
