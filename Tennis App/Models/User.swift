//
//  User.swift
//  Tennis App
//
//  Created by adyao20 on 8/3/17.
//  Copyright © 2017 adyao20. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class User: NSObject {
    
    // MARK: - Properties
    
    let uid: String
    let displayName: String?
    let age: Int?
    let gender: Bool?
    let level: Float?
    let country: String?
    let city: String?
    let phoneNumber: String?
    let info: String?
    
    // MARK: - Init
    
    init(uid: String, displayName:String?, age:Int?, gender: Bool?, level: Float?, country: String?, city: String?, phoneNumber: String?, info: String?) {
        self.uid = uid
        self.displayName = displayName
        self.age = age
        self.gender = gender
        self.level = level
        self.country = country
        self.city = city
        self.phoneNumber = phoneNumber
        self.info = info
        
        super.init()
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let displayName = dict["displayName"] as? String,
            let age = dict["age"] as? Int,
            let gender = dict["gender"] as? Bool,
            let level = dict["level"] as? Float,
            let country = dict["country"] as? String,
            let city = dict["city"] as? String,
            let phoneNumber = dict["phonenumber"] as? String,
            let info = dict["info?"] as? String

        
            else { return nil }
        
        self.uid = snapshot.key
        self.displayName = displayName
        self.age = age
        self.gender = gender
        self.level = level
        self.country = country
        self.city = city
        self.phoneNumber = phoneNumber
        self.info = info
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let displayName = aDecoder.decodeObject(forKey: Constants.UserDefaults.displayName) as? String,
            let age = aDecoder.decodeObject(forKey:Constants.UserDefaults.age) as? Int,
        let gender = aDecoder.decodeObject(forKey:Constants.UserDefaults.gender) as? Bool,
        let level = aDecoder.decodeObject(forKey:Constants.UserDefaults.level) as? Float,
            let country = aDecoder.decodeObject(forKey:Constants.UserDefaults.country) as? String,
            let city = aDecoder.decodeObject(forKey:Constants.UserDefaults.city) as? String,
            let phoneNumber = aDecoder.decodeObject(forKey:Constants.UserDefaults.phoneNumber) as? String,
            let info = aDecoder.decodeObject(forKey:Constants.UserDefaults.info) as? String

            else { return nil }
        
        self.uid = uid
        self.displayName = displayName
        self.age = age
        self.gender = gender
        self.level = level
        self.country = country
        self.city = city
        self.phoneNumber = phoneNumber
        self.info = info
        
        super.init()
    }
    
    
    // MARK: - Singleton
    
    // 1
    private static var _current: User?
    
    // 2
    static var current: User {
        // 3
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        
        // 4
        return currentUser
    }
    
    // MARK: - Class Methods
    
    // 5
    // 1
    class func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        // 2
        if writeToUserDefaults {
            // 3
            let data = NSKeyedArchiver.archivedData(withRootObject: user)
            
            // 4
            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
        }
        
        _current = user
    }
    
}


extension User: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.UserDefaults.uid)
        aCoder.encode(displayName, forKey: Constants.UserDefaults.displayName)
        aCoder.encode(age, forKey: Constants.UserDefaults.age)
        aCoder.encode(gender, forKey:Constants.UserDefaults.gender)
        aCoder.encode(level, forKey:Constants.UserDefaults.level)
        aCoder.encode(country, forKey: Constants.UserDefaults.country)
        aCoder.encode(city, forKey: Constants.UserDefaults.city)
        aCoder.encode(phoneNumber, forKey:Constants.UserDefaults.phoneNumber)
        aCoder.encode(info, forKey:Constants.UserDefaults.info)
        
    }
}
