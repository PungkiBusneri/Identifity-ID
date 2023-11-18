import UIKit
import Moya
import SwiftyJSON

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    private var cellIdentifier = "UserTableViewCell"
    private var users = [UserModel]()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 850
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)

        fetchData()
    }

    func fetchData() {
        let provider = MoyaProvider<NetworkAPIService>()
                
        provider.request(.getUsers) { result in
            switch result {
            case .success(let response):
                let data = response.data
                let json = JSON(data)
                if let jsonArray = json.array {
                    for userJSON in jsonArray {
                        let user = UserModel(json: userJSON)
                        self.users.append(user)
                        print("User ID: \(user.id ?? 0)")
                        print("User Name: \(user.name ?? "N/A")")
                        print("User Username: \(user.username ?? "N/A")")
                        print("User Email: \(user.email ?? "N/A")")
                    }
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Network request error: \(error.localizedDescription)")
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UserTableViewCell

//        let user = users[indexPath.row]
//        cell.textLabel?.text = user.name
//        cell.detailTextLabel?.text = user.email
        cell.setupCell(identificationList: users[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row]
        
        let userDetailVc = UserDetailViewController(nibName: "UserDetailViewController", bundle: nil)
        userDetailVc.selectedUser = selectedUser
        navigationController?.pushViewController(userDetailVc, animated: true)
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "UserDetail" {
//            if let userDetailVC = segue.destination as? UserDetailViewController,
//               let selectedUser = sender as? UserModel {
//                userDetailVC.selectedUser = selectedUser
//            }
//        }
//    }
}
