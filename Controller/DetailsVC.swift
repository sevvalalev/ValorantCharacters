//
//  DetailsVC.swift
//  ValorantCharacters
//
//  Created by Sevval Alev on 12.10.2022.
//

import UIKit
import SDWebImage

class DetailsVC: UIViewController {

    var character: Data?
    var ability: Abilities?
    //MARK: - Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var fullPortraitImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        prepareTableView()
        navigationController()
    }

    private func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        tableView.register(AbilityTableViewCell.self, forCellReuseIdentifier: AbilityTableViewCell.identifier)
    }
    
    //MARK: - Prepare UI
    private func prepareUI() {
        guard let character = character else {
            return
        }

        
        nameLabel.text = character.displayName
        displayNameLabel.text = character.role?.displayName
        descriptionLabel.text = character.description
        
        fullPortraitImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        guard let imageUrl = character.fullPortrait else { return }
        fullPortraitImageView.sd_setImage(with: URL(string: imageUrl))
        guard let imageUrl = character.background else { return }
        backgroundImageView.sd_setImage(with: URL(string: imageUrl))
        scrollView?.contentSize = CGSize(width: tableView.frame.size.width, height: tableView.frame.size.height)
    }
    
    //MARK: - Navigation Controller
    func navigationController(){
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .purple
    }

    
}

extension DetailsVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character?.abilities?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AbilityTableViewCell.identifier, for: indexPath) as? AbilityTableViewCell {
            cell.configure(ability: character?.abilities?[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
