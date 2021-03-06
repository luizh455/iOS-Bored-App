//
//  TermsAndConditionsViewController.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 22/06/22.
//

import UIKit

final class TermsAndConditionsViewController: UIViewController {

    private let termsAndConditionsText = "Lorem ipsum dolor sit amet consectetur adipiscing elit inceptos ridiculus iaculis, nullam ligula elementum duis tellus maecenas nec fermentum sed dictum laoreet, taciti donec habitant quam purus ultricies porta posuere sociis. Cubilia senectus netus integer tempor dignissim viverra nostra tellus scelerisque aliquet, semper penatibus tempus sociosqu class sociis bibendum justo etiam, rutrum aenean et eget pretium volutpat eu dictum dictumst. Praesent gravida ridiculus cursus luctus maecenas in libero mi interdum, auctor ullamcorper eget nam eros condimentum litora tristique erat, fusce rhoncus mauris cras aptent non et ultricies. Iaculis porttitor etiam pulvinar proin fringilla ad, sem ornare sociosqu ultrices litora himenaeos egestas, eros laoreet mauris leo porta. Nibh interdum facilisis dapibus magnis phasellus tortor fusce nostra quam, ante non elementum himenaeos id hac et hendrerit eros, dui at sollicitudin turpis viverra molestie cras quis. Dignissim faucibus auctor in vitae porttitor tellus nascetur tempor sociosqu, elementum dis ultricies eu tempus tincidunt lectus posuere, et ac interdum commodo montes convallis curae facilisis. Vitae diam phasellus litora ad aenean himenaeos, magnis malesuada nec metus faucibus, turpis mollis hac lacinia lacus. Condimentum dis in sed vel molestie integer, gravida eget volutpat interdum bibendum scelerisque magnis, penatibus non sollicitudin convallis egestas. Aptent mi ligula conubia justo habitant cubilia tellus curabitur, a nisi integer non eget vivamus cursus hac, lacus rutrum ridiculus tempor litora nostra dis. Nisl pulvinar taciti tellus diam quam dictum cursus potenti euismod natoque feugiat mattis ornare tortor, aliquam orci dapibus inceptos id egestas ante viverra donec aptent suscipit nulla. Eget nisl fringilla cras felis maecenas nisi ridiculus id conubia hac primis sem ullamcorper porttitor, rutrum ac sodales ultrices vestibulum cum leo semper fusce porta eu fermentum. Proin nisi suspendisse class facilisi curabitur quisque, fusce vulputate semper a nulla velit, duis in orci faucibus turpis. Risus metus magnis aliquam accumsan laoreet congue per, tempus purus et odio senectus sodales vulputate, ligula malesuada dis habitasse nullam pellentesque."

    @IBAction private func onClosePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

    @IBOutlet private weak var textLabel: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = termsAndConditionsText

        // Do any additional setup after loading the view.
    }
}
