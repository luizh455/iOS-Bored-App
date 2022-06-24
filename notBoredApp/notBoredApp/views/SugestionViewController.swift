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
    
    init(activity : Activity, isRandom : Bool?){
        super.init(nibName: nil, bundle: nil)
        self.activity = activity
        if let isRandom = isRandom {
            self.isRandom = isRandom
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var participantsNumberLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoriesStack: UIStackView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = activity?.activity
        participantsNumberLabel.text = "\(activity?.participants ?? 0)"
        priceLabel.text = String(activity!.price)
        categoryLabel.text = activity?.type
        

        // Do any additional setup after loading the view.
    }

    @IBAction func onTryAnotherPressed(_ sender: Any) {
        let completion : (Activity?) -> Void = { activity in
            if let activity = activity {
                let newView = SugestionViewController(
                    activity: Activity(
                    activity: activity.activity,
                    type: activity.type,
                    participants: activity.participants,
                    price: activity.price,
                    link: activity.link,
                    key: activity.key,
                    accessibility: activity.accessibility),
                    isRandom: true)
                newView.modalPresentationStyle = .fullScreen
                self.present(newView, animated: true)
            }
            
        }
        
        boredApiService.getRandomActivity(completion: completion)
    }
    
    @IBAction func onBackPressed(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }

}
