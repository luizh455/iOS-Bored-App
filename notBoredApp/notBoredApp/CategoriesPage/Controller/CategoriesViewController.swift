//
//  CategoriesViewController.swift
//  notBoredApp
//
//  Created by Luiz Henrique Lage Da Silva on 22/06/22.
//

import UIKit

final class CategoriesViewController: UIViewController {

    private let boredApiService = BoredApiService()
    private let categories = Categories()
    private var fixedParticipantsNumber : Int?

    @IBOutlet private weak var tableView: UITableView!
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

    private func showSimpleAlert() {
        let alert = UIAlertController(title: "Something went wrong...", message: "No sugestions were found.",preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            //Cancel Action
        }))
        self.present(alert, animated: true, completion: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func getCategories(){
        tableView.reloadData()
    }

    @IBAction private func onPressRandomButton(_ sender: Any) {
        let completion : (Activity?) -> Void = { activity in
            if let activity = activity {
                let newView = SugestionViewController(activity: activity, isRandom: true,
                                                      numberOfParticipants: self.fixedParticipantsNumber, self.boredApiService)

                newView.modalPresentationStyle = .fullScreen
                self.present(newView, animated: true)
            }

        }

        let error : () -> Void =  {self.showSimpleAlert()}
        boredApiService.getRandomActivity(fixedParticipantsNumber, completion: completion, onError: error)
    }
    @IBAction private func onPressBackButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }


}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.categoriesMock.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = categories.categoriesMock[indexPath.row].capitalized
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
                    numberOfParticipants: self.fixedParticipantsNumber, self.boredApiService)
                newView.modalPresentationStyle = .fullScreen
                self.present(newView, animated: true)
            }

        }
        let error : () -> Void =  { self.showSimpleAlert()}
        boredApiService.getActivity(by: categories.categoriesMock[indexPath.row], fixedParticipantsNumber, completion: completion, onError: error)
    }
}
