//
//  CategoriesViewController.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 22/06/22.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    let boredApiService = BoredApiService()
    

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
    
    private func getCategories(){
        tableView.reloadData()
    }
    @IBAction func onPressRandomButton(_ sender: Any) {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoriesMock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = categoriesMock[indexPath.row]
        cell.backgroundColor = UIColor.cyan
        cell.accessoryType = .disclosureIndicator
        
        
        return cell
    }
}
