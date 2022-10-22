//
//  ViewController.swift
//  ValorantCharacters
//
//  Created by Sevval Alev on 12.10.2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    var characterManager = CharacterManager()
    var characters : CharacterData? {
        didSet{
            tableView.reloadData()
        }
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        prepareTableView()
        
    }
    
    private func prepareTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func fetchData() {
        characterManager.delegate = self
        characterManager.characterJson()
    }
}
//MARK: - SendCharacterDataTransferDelegate
extension ViewController: SendCharacterDataTransferDelegate{
    func sendCharacterData(character: CharacterData) {
        characters = character
    }
}

//MARK: - Tableview Delegate§DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as?
            CharacterCell {
            cell.configure(with: characters?.data?[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()// ?
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "toDetailsVC") as? DetailsVC{
            let selectedCharacter = characters?.data?[indexPath.row]
            vc.character = selectedCharacter
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
}
