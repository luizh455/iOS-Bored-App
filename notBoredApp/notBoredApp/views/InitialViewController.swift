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
        let newView = CategoriesViewController(numberOfParticipants: Int(participantsTextField.text!))
        newView.modalPresentationStyle = .fullScreen
        present(newView, animated: true)
        
    }
    @IBAction func onPressedTermsAndConditionsButton(_ sender: Any) {
        let newView = TermsAndConditionsViewController()
        newView.modalPresentationStyle = .fullScreen
        present(newView, animated: true)
    }    

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
        } else if(Int(txt) ?? 0 >= 1){
            StartButton.isEnabled = true
        }
        else
        {
            StartButton.isEnabled = false
        }
        
    }
}
