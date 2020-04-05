import UIKit
import Bond
import ReactiveKit

class ViewController: UIViewController {
    
    private let homeworks = MutableObservableArray<String>(["Задача A","Задача B","Задача C","Задача D","Задача E","Bonus"])
    @IBOutlet weak var homeWorkTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeworks.bind(to: homeWorkTableView) { (dataSourse, indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "hmCell") as! HMTableViewCell
            cell.homeWorkCell.text = self.homeworks[indexPath.row]
            return cell
        }
        homeWorkTableView.reactive.selectedRowIndexPath.observeNext { [unowned self](indexPath) in
            switch indexPath.row {
            case 0:
                self.open(identifier: "aHomeWork", vc: AViewController.self)
            case 1:
                self.open(identifier: "bHomeWork", vc: BViewController.self)
            case 2:
                self.open(identifier: "cHomeWork", vc: CViewController.self)
            case 3:
                self.open(identifier: "dHomeWork", vc: DViewController.self)
            case 4:
                self.open(identifier: "eHomeWork", vc: EViewController.self)
            case 5:
                self.open(identifier: "bonusHomeWork", vc: BonusViewController.self)
            default:
                let alert = UIAlertController()
                alert.addAction(UIAlertAction(title: "Error!", style: .destructive, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    deinit {
        print("InitialVC---")
    }
}

extension ViewController {
    func open<T: UIViewController>(identifier: String, vc: T.Type) {
        let vc = storyboard!.instantiateViewController(identifier: identifier) as! T
        present(vc, animated: true)
    }
}
