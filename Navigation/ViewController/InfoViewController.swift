
import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray

        let buttonAlert = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        buttonAlert.setTitle("Allert", for: .normal)
        buttonAlert.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(buttonAlert)
    }
    
    @objc func tap(){
        
        let alertVC = UIAlertController(title: "Error", message: "Ошибка", preferredStyle: .alert)
        
        let firstAlertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in print("Нажали - OK")})
    
        let secondAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in print("Нажали - Cancel")})
        
        alertVC.addAction(firstAlertAction)
        alertVC.addAction(secondAlertAction)
        
        self.present(alertVC, animated: true, completion: nil)
        
    }

}
