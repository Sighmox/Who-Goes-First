//
//  TeamPickerViewController.swift
//  Who Goes First
//
//  Created by Paul Baker on 2/5/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import UIKit


class TeamPickerViewController: UIViewController {
   
    
    // Outlets for the label, textfields and button
    @IBOutlet weak var whoGoesFirst: UILabel!
    @IBOutlet weak var textFieldTeamOne: UITextField!
    @IBOutlet weak var textFieldTeamTwo: UITextField!
    @IBOutlet weak var goesFirst: UIButton!
    
    @IBAction func textFieldTeamTwo(_ sender: UITextField) {
    }
    
   
    override func viewDidLoad() {
        super .viewDidLoad()
        
        //This sets the button title and disables the button
        goesFirst.setTitle("Enter both team names", for: .disabled)
        goesFirst.isEnabled = false
        
        textFieldTeamOne.delegate = self
        textFieldTeamTwo.delegate = self
        
    }
    // This button determines the team to be picked
    @IBAction func pickerButton(_ sender: AnyObject) {
        
        if let teamOne = textFieldTeamOne.text, let teamTwo = textFieldTeamTwo.text, !teamOne.isEmpty, !teamTwo.isEmpty  {
            // randomizes the team names displayed
            let teams = [teamOne, teamTwo]
            let randomteam = teams.randomElement()
            whoGoesFirst.text = randomteam
            
            } else {
                print("You must enter a team name into both textfields")
            } 
    
            }
    // This changes the button title and enables it
    @IBAction func bothTextFieldsChanged(_ sender: UITextField) {
        // Checks if both fields are full
        if textFieldTeamOne.text != "" && textFieldTeamTwo.text != "" {
        goesFirst.setTitle("Set a Random Order", for: .normal)
        goesFirst.isEnabled = true
        print("This is being called")
        } else {
            goesFirst.setTitle("Enter both team names", for: .disabled)
            goesFirst.isEnabled = false
        }
    
    }


}


extension TeamPickerViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

