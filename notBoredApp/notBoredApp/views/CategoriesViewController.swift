//
//  CategoriesViewController.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 22/06/22.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    let boredApiService = BoredApiService()
    var fixedParticipantsNumber : Int?
    

    let categoriesMock = ["education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        getCategories()
        // Do any additional setup after loading the view.
    }
    
    init(numberOfParticipants : Int?){
        super.init(nibName: nil, bundle: nil)
        fixedParticipantsNumber = numberOfParticipants
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getCategories(){
        tableView.reloadData()
    }
    
    @IBAction func onPressRandomButton(_ sender: Any) {
        let completion : (Activity?) -> Void = { activity in
            if let activity = activity {
                let newView = SugestionViewController(activity: activity, isRandom: true, numberOfParticipants: self.fixedParticipantsNumber)
                
                newView.modalPresentationStyle = .fullScreen
                self.present(newView, animated: true)
            }
            
        }
        boredApiService.getRandomActivity(fixedParticipantsNumber, completion: completion)
    }
    @IBAction func onPressBackButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoriesMock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = categoriesMock[indexPath.row].capitalized
        //cell.backgroundColor = UIColor.blue
        
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let completion : (Activity?) -> Void = { activity in
            if let activity = activity {
                let newView = SugestionViewController(
                    activity: activity,
                    isRandom: false,
                    numberOfParticipants: self.fixedParticipantsNumber)
                newView.modalPresentationStyle = .fullScreen
                self.present(newView, animated: true)
            }
            
        }
        
        boredApiService.getActivity(by: categoriesMock[indexPath.row], fixedParticipantsNumber) { activity in
            completion(activity)
        }
    }
}
