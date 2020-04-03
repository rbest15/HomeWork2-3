import UIKit
import ReactiveKit
import Bond

class DViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    var counter = Property(0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.reactive.tap.observe { [weak self]  _ in
            self?.counter.value += 1
        }
        counter.map { number in "\(number)"}.bind(to: counterLabel)
    }
    
    deinit {
        print("DViewController---")
    }
}
