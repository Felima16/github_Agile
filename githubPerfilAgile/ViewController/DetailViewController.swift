//
//  DetailViewController.swift
//  githubPerfilAgile
//
//  Created by Fernanda de Lima on 17/02/2018.
//  Copyright © 2018 Empresinha. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var repositoriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        userImage.roundedImage()
        userImage.layer.borderWidth = 1
        userImage.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userImage.roundedImage()
    }

    private func initSetup(){
        //border user view
        userView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        userView.layer.borderWidth = 1
        
        userNameLabel.text = mm.repositories?.first?.owner?.username
        
        //open avatar image
        let imageUrl = URL(string: (mm.repositories?.first?.owner?.avataURL)!)!
        
        if let data = try? Data(contentsOf: imageUrl)
        {
            let image = UIImage(data: data)!
            userImage.image = image
        }else{
            let image = UIImage(named: "noImage")!
            userImage.image = image
        }
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mm.repositories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryCell", for: indexPath) as! RepositoryTableViewCell
        
        cell.titleLabel.text = mm.repositories?[indexPath.row].name
        cell.languageLabel.text = mm.repositories?[indexPath.row].language
        
        return cell
    }
    
}

extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = CGFloat(roundf(Float(self.frame.size.width/2.0)))
        self.clipsToBounds = true
    }
}
