import UIKit
import Bond
import ReactiveKit

class AViewController: UIViewController {


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
        emailTextField.reactive.text.ignoreNils().filter { $0.count > 0 }.map { [weak self] in  self?.isValidEmail($0) ?? false ? "" : "Incorrect email!" }.bind(to: errorLabel)
        passwordTextField.reactive.text.ignoreNils().filter { $0.count > 0}.map { $0.count < 6 ? "Short password" : "" }.bind(to: errorLabel)
        sendButton.reactive.controlEvents(.touchUpInside).observeNext { [weak self] in
            let alert = UIAlertController(title: "Ok", message: "Successfully sent!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self?.present(alert, animated: true)
        }
        combineLatest(self.emailTextField.reactive.text, self.passwordTextField.reactive.text)
            .map { [weak self] (email, pass) in
                return self?.isValidEmail(email!) ?? false && pass!.count > 5 }
            .bind(to: self.sendButton.reactive.isEnabled)
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    deinit {
        print("AViewController---")
    }
}
