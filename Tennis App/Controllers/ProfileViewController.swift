//
//  ViewController.swift
//  Tennis App
//
//  Created by adyao20 on 8/2/17.
//  Copyright © 2017 adyao20. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var age: Int?
    var gender: Bool?
    var level: Float?
    var country: String?
    var city: String?
    var phoneNumber: String?
    var info: String?
    
    //PICKER VIEWS
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return 83
        } else if pickerView.tag == 1 {
            return 14
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return String(row + 18) //age
        } else if pickerView.tag == 1 {
            return String(Double(row) / 2 ) //level
        } else {
            return ""
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agePicker.delegate = self
        agePicker.dataSource = self
        levelPicker.delegate = self
        levelPicker.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
//OUTLET
    @IBOutlet weak var profilePicButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    @IBOutlet weak var levelPicker: UIPickerView!
    @IBOutlet weak var contryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var matchButton: UIButton!
    
    
    //ACTION
    
    
    @IBAction func profileButtonTapped(_ sender: Any) {
        
        
        
        print("Profile ICE CREAM")
    }
    
    
    @IBAction func genderSegmentedControlTapped(_ sender: Any) {
        
        
        print("SEGMENT CONTROL ICE CREAM")
    }
    
    
    @IBAction func matchButtonTapped(_ sender: Any) {
        func create(_firUser:FIRUser, age: Int?, gender: Bool?, level: Float, country: String?, city: String?, phoneNumber: String?, info:String?) {
            
            
            
        }
        print("MATCH BUTTON ICE CREAM")

    }
  
    
    

}

//EXTENSIONS

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
