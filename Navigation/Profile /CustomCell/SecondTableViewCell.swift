
import UIKit

class SecondTableViewCell: UITableViewCell {

    let  passwordTextFild: UITextField = {
        let passwordTextFild = UITextField ()
        passwordTextFild.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFild.backgroundColor = .systemGray6
        passwordTextFild.textColor = .black
        passwordTextFild.font = UIFont.systemFont(ofSize: 16)
        passwordTextFild.autocapitalizationType = .none
        passwordTextFild.placeholder = "Password"
        passwordTextFild.layer.borderWidth = 0.5
        passwordTextFild.layer.borderColor = UIColor.lightGray.cgColor
        
        let spacerStatusTextFild = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        passwordTextFild.leftViewMode = UITextField.ViewMode.always
        passwordTextFild.leftView = spacerStatusTextFild
        
        return passwordTextFild
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondTableViewCell {
    private func setupView() {
        
        contentView.addSubview(passwordTextFild)
        passwordTextFild.isSecureTextEntry = true
        
        let constraintsPasswordTextFild = [
            passwordTextFild.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            passwordTextFild.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            passwordTextFild.topAnchor.constraint(equalTo: contentView.topAnchor),
            passwordTextFild.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            passwordTextFild.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraintsPasswordTextFild)
    }
}
