//
//  InitialViewController.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 22/06/22.
//

import UIKit

class InitialViewController: UIViewController {
    


    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var participantsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
        // Do any additional setup after loading the view.
    }

    func setupTextField() {
        participantsTextField.delegate = self
        participantsTextField.keyboardType = .numberPad
    }

    @IBAction func onPressStartButton(_ sender: UIButton) {
        let newView = CategoriesViewController()
        newView.modalPresentationStyle = .fullScreen
        present(newView, animated: true)
        
    }
    @IBAction func onPressedTermsAndConditionsButton(_ sender: Any) {
        let newView = TermsAndConditionsViewController()
        newView.modalPresentationStyle = .fullScreen
        present(newView, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension InitialViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
            return string.rangeOfCharacter(from: invalidCharacters) == nil
        }

    @IBAction func editingChanged(_ sender: UITextField) {
        let txt = participantsTextField.text!
         
        if(txt == "")
        {
            StartButton.isEnabled = true
            print("enable")
        } else if(Int(txt) ?? 0 >= 1){
            StartButton.isEnabled = true
            print("enable")
        }
        else
        {
            StartButton.isEnabled = false
            print("disable")
        }
        
    }
}
