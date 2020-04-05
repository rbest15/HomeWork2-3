import UIKit
import ReactiveKit
import Bond

class BonusViewController: UIViewController {

    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var someTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        someTextField.reactive.text.ignoreNils().filter { $0.count > 10}.observeNext { (_) in
            
            //Внутри замыкания возникает strong ссылка self, что на дает убрать из памяти этот вью при закрытии
            self.alert()
        }
    }
    func alert(){
        let alert = UIAlertController(title: "Alert", message: "Too much!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        self.someTextField.text = ""
    }
    
    deinit {
        print("BonusViewController---")
    }
}
