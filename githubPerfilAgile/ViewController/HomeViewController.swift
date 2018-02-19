//
//  ViewController.swift
//  githubPerfilAgile
//
//  Created by Fernanda de Lima on 17/02/2018.
//  Copyright © 2018 Empresinha. All rights reserved.
//

import UIKit
import MyAlertController

class HomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameText: UITextField!
    
    @IBAction func searchActionButton(_ sender: Any) {
       self.searchPerfil()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - Textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == userNameText) {
            searchPerfil()
        }
        return true
    }
    
    //MARK: - Functions
    private func searchPerfil(){
        let url = "https://api.github.com/users/\(userNameText.text ?? "")/repos"
        
        GithubAPI.getArray(Repositories.self, url: url, success: { (item) in
            if !item.isEmpty{
                mm.repositories = item
                let detail = self.storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
                self.navigationController?.pushViewController(detail, animated: true)
            }else{
                let alert = MyAlert(title: "User not found", message: "User not found. Please enter another name")
                let okButton = MyAlertAction(title: "OK", dismissOnTap: true, action: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
            
            
        }) { (error) in
            let alert = MyAlert(title: "Error", message: "A network error has occurred. Check your Internet connection and try again later.")
            let okButton = MyAlertAction(title: "OK", dismissOnTap: true, action: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            print("**** error \(error.localizedDescription)")
        }
    }

}

