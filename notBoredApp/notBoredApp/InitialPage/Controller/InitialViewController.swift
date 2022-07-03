//
//  InitialViewController.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 22/06/22.
//

import UIKit

final class InitialViewController: UIViewController {

    @IBOutlet private weak var StartButton: UIButton!
    @IBOutlet private weak var participantsTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextField()
        // Do any additional setup after loading the view.
    }

    private func setupTextField() {
        participantsTextField.delegate = self
        participantsTextField.keyboardType = .numberPad
    }

    @IBAction private func onPressStartButton(_ sender: UIButton) {
        let newView = CategoriesViewController(numberOfParticipants: Int(participantsTextField.text!))
        newView.modalPresentationStyle = .fullScreen
        present(newView, animated: true)

    }
    @IBAction private func onPressedTermsAndConditionsButton(_ sender: Any) {
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

    @IBAction private func editingChanged(_ sender: UITextField) {
        let text = participantsTextField.text! //guard let return


        let canEnableButton = text.isEmpty || Int(text) ?? 0 >= 1
        StartButton.isEnabled = canEnableButton
        //        if(text.isEmpty || (Int(text) ?? 0 >= 1) )
        //        {
        //            StartButton.isEnabled = true
        //        }
        //        else
        //        {
        //            StartButton.isEnabled = false
        //        }

    }
}
