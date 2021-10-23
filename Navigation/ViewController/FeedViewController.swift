
import UIKit

class FeedViewController: UIViewController {
    
    let firstButton: UIButton = {
        let firstButton = UIButton()
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.backgroundColor = .lightGray
        firstButton.layer.cornerRadius = 5
        firstButton.setTitle("Post", for: .normal)
        return firstButton
    } ()
    
    let secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.backgroundColor = .gray
        secondButton.layer.cornerRadius = 5
        secondButton.setTitle("Post", for: .normal)
        return secondButton
    } ()
    
    struct Post {
        var title: String
    }
    var post = Post(title: "Post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(firstButton)
        self.firstButton.addTarget(self, action: #selector(tap1), for: .touchUpInside)
        
        self.view.addSubview(secondButton)
        self.secondButton.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [firstButton, secondButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
//        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
//        button.setTitle("Post", for: .normal)
//        button.backgroundColor = .systemPink
//        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
//        view.addSubview(button)

        [
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(greaterThanOrEqualTo: self.view.widthAnchor, multiplier: 0.5)
        ]

        .forEach {
            $0.isActive = true
        }
        
    }
    
    @objc func tap1(){
        let postVC = PostViewController()
        postVC.view.backgroundColor = .blue
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    @objc func tap2(){
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }

}
