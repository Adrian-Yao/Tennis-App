//
//  AuthService.swift
//  Tennis App
//
//  Created by adyao20 on 8/19/17.
//  Copyright © 2017 adyao20. All rights reserved.
//

import UIKit
import FirebaseAuth

struct AuthService {
    static func authListener(viewController view : UIViewController) -> AuthStateDidChangeListenerHandle {
        let authHandle = Auth.auth().addStateDidChangeListener() { (auth, user) in
            guard user == nil else { return }
            
            let loginViewController = UIStoryboard.initialViewController(for: .login)
            view.view.window?.rootViewController = loginViewController
            view.view.window?.makeKeyAndVisible()
        }
        return authHandle
    }
    
    static func removeAuthListener(authHandle : AuthStateDidChangeListenerHandle?){
        if let authHandle = authHandle {
            Auth.auth().removeStateDidChangeListener(authHandle)
        }
    }
    
    static func presentLogOut(viewController : UIViewController){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let signOutAction = UIAlertAction(title: "Log Out", style: .destructive) { _ in
            logUserOut()
        }
        
        alertController.addAction(signOutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        viewController.present(alertController, animated: true)
    }
    //It logs out, just need to direct it to the loginViewController. How?
    static func logUserOut(){
        do {
            try Auth.auth().signOut()
        } catch let error as NSError {
            assertionFailure("Error signing out: \(error.localizedDescription)")
        }
    }
    
    private static func loginErrors(error : Error, controller : UIViewController){
        switch (error.localizedDescription) {
        case "The email address is badly formatted.":
            let invalidEmailAlert = UIAlertController(title: "Invalid Email", message:
                "It seems like you have put in an invalid email.", preferredStyle: UIAlertControllerStyle.alert)
            invalidEmailAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            controller.present(invalidEmailAlert, animated: true, completion: nil)
            break;
        case "The password is invalid or the user does not have a password.":
            let wrongPasswordAlert = UIAlertController(title: "Wrong Password", message:
                "It seems like you have entered the wrong password.", preferredStyle: UIAlertControllerStyle.alert)
            wrongPasswordAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            controller.present(wrongPasswordAlert, animated: true, completion: nil)
            break;
        case "There is no user record corresponding to this identifier. The user may have been deleted.":
            let wrongPasswordAlert = UIAlertController(title: "No Account Found", message:
                "We couldn't find an account that corresponds to that email. Do you want to create an account?", preferredStyle: UIAlertControllerStyle.alert)
            wrongPasswordAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            controller.present(wrongPasswordAlert, animated: true, completion: nil)
            break;
        default:
            let loginFailedAlert = UIAlertController(title: "Error Logging In", message:
                "There was an error logging you in. Please try again soon.", preferredStyle: UIAlertControllerStyle.alert)
            loginFailedAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            controller.present(loginFailedAlert, animated: true, completion: nil)
            break;
        }
    }
//    
//    private static func signUpErrors(error: Error, controller: UIViewController) {
//        switch(error.localizedDescription) {
//        case "The email address is badly formatted.":
//            let invalidEmail = UIAlertController(title: "Email is not properly formatted.", message:
//                "Please enter a valid email to sign up with..", preferredStyle: UIAlertControllerStyle.alert)
//            invalidEmail.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
//            controller.present(invalidEmail, animated: true, completion: nil)
//            break;
//        default:
//            let generalErrorAlert = UIAlertController(title: "We are having trouble signing you up.", message:
//                "We are having trouble signing you up, please try again soon.", preferredStyle: UIAlertControllerStyle.alert)
//            generalErrorAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
//            controller.present(generalErrorAlert, animated: true, completion: nil)
//            break;
//        }
//    }
//
    
    
    
    
}
