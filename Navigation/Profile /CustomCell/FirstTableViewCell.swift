
import UIKit

class FirstTableViewCell: UITableViewCell {
    let  logInTextFild: UITextField = {
        let logInTextFild = UITextField ()
        logInTextFild.translatesAutoresizingMaskIntoConstraints = false
        logInTextFild.backgroundColor = .systemGray6
        logInTextFild.textColor = .black
        logInTextFild.font = UIFont.systemFont(ofSize: 16)
        logInTextFild.autocapitalizationType = .none
        logInTextFild.placeholder = "Email of phone"
        logInTextFild.layer.borderWidth = 0.5
        logInTextFild.layer.borderColor = UIColor.lightGray.cgColor
        
        let spacerStatusTextFild = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        logInTextFild.leftViewMode = UITextField.ViewMode.always
        logInTextFild.leftView = spacerStatusTextFild
        
        return logInTextFild
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FirstTableViewCell {
    private func setupView() {
        
        contentView.addSubview(logInTextFild)
        
        let constraintsLogInTextFild = [
            logInTextFild.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logInTextFild.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            logInTextFild.topAnchor.constraint(equalTo: contentView.topAnchor),
            logInTextFild.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            logInTextFild.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraintsLogInTextFild)
    }
}

