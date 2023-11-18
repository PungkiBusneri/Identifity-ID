//
//  UserDetailViewController.swift
//  SwiftyJSONTest
//
//  Created by Pungki Busneri on 03/11/23.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet var userImage: UIImageView!
    
    @IBOutlet var userId: UILabel!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userPhone: UILabel!
    @IBOutlet var userEmail: UILabel!
    @IBOutlet var userAddress: UILabel!
    @IBOutlet var userWebsites: UILabel!
    @IBOutlet var userCompany: UILabel!
    
    
    var selectedUser: UserModel?
    //    private var: users = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = selectedUser {
            userName.text = user.name
            userId.text = "\(user.id ?? 0)"
            userPhone.text = "\(user.phone ?? "N/A")"
            userEmail.text = "\(user.email ?? "N/A")"
            
            if let address = user.address {
                userAddress.text = "\(address.street ?? "") \(address.suite ?? "") \(address.city ?? "") \(address.zipcode ?? "")"
            }
            userWebsites.text = "\(user.website ?? "N/A")"
            
            if let company = user.company {
                userCompany.text = "\(company.name ?? "N/A")"
                
                let image = UIImage(systemName: "person.crop.rectangle.fill")
            }
        }
    }
}


