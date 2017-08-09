//
//  ViewController.swift
//  Tennis App
//
//  Created by adyao20 on 8/2/17.
//  Copyright © 2017 adyao20. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    @IBAction func genderSegmentControlTapped(_ sender: Any) {
        
        print("SEGMENT CONTROL ICE CREAM")
    }
    
    
    @IBAction func matchButtonTapped(_ sender: Any) {
     
        print("MATCH BUTTON ICE CREAM")
    }
    
    
    
}

