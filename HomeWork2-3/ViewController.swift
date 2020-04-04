import UIKit
import Bond
import ReactiveKit

class ViewController: UIViewController {
    
    private let homeworks = ["Задача A","Задача B","Задача C","Задача D","Задача E","Bonus"]
    @IBOutlet weak var homeWorkTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeworks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hmCell") as! HMTableViewCell
        cell.homeWorkCell.text = homeworks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            open(identifier: "aHomeWork", vc: AViewController.self)
        case 1:
            open(identifier: "bHomeWork", vc: BViewController.self)
        case 2:
            open(identifier: "cHomeWork", vc: CViewController.self)
        case 3:
            open(identifier: "dHomeWork", vc: DViewController.self)
        case 4:
            open(identifier: "eHomeWork", vc: EViewController.self)
        case 5:
            open(identifier: "bonusHomeWork", vc: BonusViewController.self)
        default:
            let alert = UIAlertController()
            alert.addAction(UIAlertAction(title: "Error!", style: .destructive, handler: nil))
            present(alert, animated: true)
        }
    }
    func open<T: UIViewController>(identifier: String, vc: T.Type) {
        let vc = storyboard!.instantiateViewController(identifier: identifier) as! T
        present(vc, animated: true)
    }
}
