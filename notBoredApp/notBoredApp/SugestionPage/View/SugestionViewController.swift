//
//  SugestionViewController.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 23/06/22.
//

import UIKit

final class SugestionViewController: UIViewController {

    private var activity : Activity?
    private var boredApiService : BoredApiService?
    private var isRandom = false
    private var numberOfParticipants : Int?

    init(activity : Activity, isRandom : Bool?, numberOfParticipants : Int?, _ boredApiService : BoredApiService){
        super.init(nibName: nil, bundle: nil)
        self.boredApiService = boredApiService
        self.numberOfParticipants = numberOfParticipants
        self.activity = activity
        if let isRandom = isRandom {
            self.isRandom = isRandom
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var participantsNumberLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var categoriesStack: UIStackView!
    @IBOutlet private weak var categoryLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }


    func updateLabels() {
        DispatchQueue.main.async {
            self.descriptionLabel.text = self.activity?.activity
            self.participantsNumberLabel.text = "\(self.activity?.participants ?? 0)"
            self.priceLabel.text = String(self.activity!.priceString)
            self.categoryLabel.text = self.activity?.type.capitalized
            self.titleLabel.text = self.isRandom ? "Random" : self.activity?.type.capitalized
            self.categoriesStack.isHidden = self.isRandom ? false : true
        }

        //self.reloadInputViews()


    }

    func showSimpleAlert() {
           let alert = UIAlertController(title: "Something went wrong...", message: "No sugestions were found.",preferredStyle: .alert)

           alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
           }))
           self.present(alert, animated: true, completion: nil)
       }


    @IBAction func onTryAnotherPressed(_ sender: Any) {
        let completion : (Activity?) -> Void = { activity in
            if let activity = activity {
                self.activity = activity
                self.updateLabels()

            }

        }

        let error : () -> Void =  { self.showSimpleAlert()}
        if let boredApiService = boredApiService {
            isRandom
            ? boredApiService.getRandomActivity(numberOfParticipants, completion: completion, onError: error)
            : boredApiService.getActivity(by: activity!.type, numberOfParticipants, completion: completion, onError: error)
        }

    }

    @IBAction func onBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
