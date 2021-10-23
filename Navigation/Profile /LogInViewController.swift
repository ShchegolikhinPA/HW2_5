
import UIKit

class LogInViewController: UIViewController {
    
    let  scrollView: UIScrollView = {
    let  scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
    } ()
    
    let containerView: UIView = {
    let containerView = UIView()
    containerView.translatesAutoresizingMaskIntoConstraints = false
    return containerView
    } ()
    
    let vcImageView: UIImageView = {
    let vcImageView = UIImageView()
        vcImageView.translatesAutoresizingMaskIntoConstraints = false
        vcImageView.image = UIImage(named: "logo.png")
    return vcImageView
    } ()
    
    let registrationTableView: UITableView = {
        let registrationTableView = UITableView(frame: .zero, style: .plain)
        registrationTableView.translatesAutoresizingMaskIntoConstraints = false
        registrationTableView.layer.borderColor = UIColor.lightGray.cgColor
        registrationTableView.layer.borderWidth = 0.5
        registrationTableView.layer.cornerRadius = 10
        return registrationTableView
    } ()
    
    let logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.backgroundColor = UIColor(named: "Color")
        logInButton.setTitle("Log In", for: .normal)
        logInButton.layer.cornerRadius = 10
        return logInButton
    } ()
    
    let cellIDLoginTextFild = "cellIDLoginTextFild"
    let cellIDPasswordTextFild = "cellIDPasswordTextFild"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(vcImageView)
        containerView.addSubview(registrationTableView)
        containerView.addSubview(logInButton)
        
        registrationTableView.dataSource = self
        
        registrationTableView.register(FirstTableViewCell.self, forCellReuseIdentifier: cellIDLoginTextFild)
        registrationTableView.register(SecondTableViewCell.self, forCellReuseIdentifier: cellIDPasswordTextFild)
        
        logInButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
        scrollView.delegate = self
        
        [
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            vcImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            vcImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 120),
            vcImageView.heightAnchor.constraint(equalToConstant: 100),
            vcImageView.widthAnchor.constraint(equalToConstant: 100),
            
            registrationTableView.topAnchor.constraint(equalTo: vcImageView.bottomAnchor, constant: 120),
            registrationTableView.centerXAnchor.constraint(equalTo: vcImageView.centerXAnchor),
            registrationTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            registrationTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            registrationTableView.heightAnchor.constraint(equalToConstant: 100),
            
            logInButton.topAnchor.constraint(equalTo: registrationTableView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: registrationTableView.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: registrationTableView.trailingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
        ]
        
        .forEach {
            $0.isActive = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func tap() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
        
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
   
}

extension LogInViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var sectionTableViewCell = UITableViewCell()
        
        if (indexPath.row % 2 == 0) {
            sectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIDLoginTextFild, for: indexPath)
        } else {
            sectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIDPasswordTextFild, for: indexPath)
        }
        return sectionTableViewCell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
}


