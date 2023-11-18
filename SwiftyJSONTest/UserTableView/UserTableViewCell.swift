//
//  UserTableViewCell.swift
//  SwiftyJSONTest
//
//  Created by Pungki Busneri on 03/11/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userName: UILabel!
    
    private var users: [String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.layer.cornerRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setupCell(identificationList: UserModel){
        userName.text = identificationList.name
        userImage.image = UIImage(systemName: "person.crop.rectangle.fill")
        print("Name111: \(identificationList.name)")
    }
}
