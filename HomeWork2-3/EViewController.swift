import UIKit
import ReactiveKit
import Bond

class EViewController: UIViewController {

    @IBOutlet weak var key1Button: UIButton!
    @IBOutlet weak var key2Button: UIButton!
    @IBOutlet weak var rocketLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        rocketLabel.text = "Rocket launch!"
        rocketLabel.alpha = 0
        combineLatest(key1Button.reactive.tap, key2Button.reactive.tap).map { $0 == $1}.filter { true }.map { 1 }.bind(to: rocketLabel.reactive.alpha)
    }
    deinit {
        print("EViewController---")
    }
}
