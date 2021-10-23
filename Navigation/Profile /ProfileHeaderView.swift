
import UIKit

class ProfileHeaderView: UIView {
    
    let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView ()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "Hipster_Cat.jpg")
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 50
        return avatarImageView
    } ()
    
    let fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.text = "#Hamilton_the_Hipster_Cat"
        fullNameLabel.font = UIFont.systemFont(ofSize: 18)
        return fullNameLabel
    } ()
    
    let setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.backgroundColor = .blue
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 10
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return setStatusButton
    } ()
    
    let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Waiting for someting..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return statusLabel
    } ()
    
    let statusTextFild: UITextField = {
        let statusTextFild = UITextField()
        statusTextFild.translatesAutoresizingMaskIntoConstraints = false
        statusTextFild.backgroundColor = .white
        statusTextFild.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextFild.textColor = .black
        statusTextFild.placeholder = "Waiting for someting..."
        statusTextFild.layer.borderWidth = 1
        statusTextFild.layer.borderColor = UIColor.black.cgColor
        statusTextFild.layer.cornerRadius = 12
        
        let spacerStatusTextFild = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        statusTextFild.leftViewMode = UITextField.ViewMode.always
        statusTextFild.leftView = spacerStatusTextFild
        
        return statusTextFild
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(setStatusButton)
        self.addSubview(statusLabel)
        self.addSubview(statusTextFild)
        
        [
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            
            self.fullNameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            self.fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            
            self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 32),
            self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            self.statusTextFild.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -16),
            self.statusTextFild.leadingAnchor.constraint(equalTo: self.fullNameLabel.leadingAnchor, constant: 0),
            self.statusTextFild.trailingAnchor.constraint(equalTo: self.fullNameLabel.trailingAnchor, constant: 0),
            self.statusTextFild.heightAnchor.constraint(equalToConstant: 40),
            
            self.statusLabel.bottomAnchor.constraint(equalTo: self.statusTextFild.topAnchor, constant: -16),
            self.statusLabel.leadingAnchor.constraint(equalTo: self.fullNameLabel.leadingAnchor, constant: 0),
            self.statusLabel.trailingAnchor.constraint(equalTo: self.fullNameLabel.trailingAnchor, constant: 0)
        ]
        
        .forEach {
            $0.isActive = true
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonPressed() {
        if let newStatusLabel = statusTextFild.text {
            statusLabel.text = newStatusLabel
        }
    }
}

