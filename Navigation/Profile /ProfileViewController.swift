
import UIKit

class ProfileViewController: UIViewController {
    
   lazy var contentTableView: UITableView = {
    let contentTableView = UITableView(frame: .zero, style: .grouped)
        contentTableView.translatesAutoresizingMaskIntoConstraints = false
        return contentTableView
    } ()
    
    let cellID = "cellID"
    let cellCollectionPhotosID = "cellCollectionPhotosID"
    let headerID = String(describing: ProfileHeaderForSectionHeaderFooterView.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentTableView)
        setupContentTableViewConstraint()
        view.backgroundColor = .white
        
        contentTableView.dataSource = self
        contentTableView.delegate = self
        
        contentTableView.register(ProfileHeaderTableViewCell.self, forCellReuseIdentifier: cellID)
        contentTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: cellCollectionPhotosID)
        contentTableView.register(ProfileHeaderForSectionHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: headerID)
    }
}

extension ProfileViewController {
    
    func  setupContentTableViewConstraint() {
        let setupContentTableViewConstraint = [
            contentTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
    
        NSLayoutConstraint.activate(setupContentTableViewConstraint)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let sectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellCollectionPhotosID, for: indexPath)
            
            return sectionTableViewCell
        }
            else {
                let sectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ProfileHeaderTableViewCell
                sectionTableViewCell.contentPosts = contentPost[indexPath.row]
            return sectionTableViewCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if (indexPath.row == 0) {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
            navigationController?.navigationBar.isHidden = false
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID)
        return headerView
    }

}

