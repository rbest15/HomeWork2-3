import UIKit

class BViewController: UIViewController {

    @IBOutlet weak var searthTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        searthTextField.reactive.text.ignoreNils().filter { $0.count > 0 }.debounce(for: 0.5).observeNext { (text) in
            print("Отправка запроса для <\(text)>")
        }
    }
}
