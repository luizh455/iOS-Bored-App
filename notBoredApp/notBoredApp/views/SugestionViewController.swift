//
//  SugestionViewController.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 23/06/22.
//

import UIKit

class SugestionViewController: UIViewController {

    var activity : Activity?
    let boredApiService = BoredApiService()
    var isRandom = false
    var numberOfParticipants : Int?
    
    init(activity : Activity, isRandom : Bool?, numberOfParticipants : Int?){
        super.init(nibName: nil, bundle: nil)
        self.numberOfParticipants = numberOfParticipants
        self.activity = activity
        if let isRandom = isRandom {
            self.isRandom = isRandom
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var participantsNumberLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoriesStack: UIStackView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
       
        

        // Do any additional setup after loading the view.
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

    @IBAction func onTryAnotherPressed(_ sender: Any) {
        let completion : (Activity?) -> Void = { activity in
            if let activity = activity {
                self.activity = activity
                self.updateLabels()
            
//                let newView = SugestionViewController(
//                    activity: activity,
//                    isRandom: self.isRandom)
//                newView.modalPresentationStyle = .fullScreen
//                self.present(newView, animated: true)
            }
            
        }
        isRandom
        ? boredApiService.getRandomActivity(numberOfParticipants, completion: completion)
        : boredApiService.getActivity(by: activity!.type, numberOfParticipants, completion: completion)
    }
    
    @IBAction func onBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
//        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }

}
