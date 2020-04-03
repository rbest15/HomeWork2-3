import UIKit
import ReactiveKit
import Bond

class CViewController: UIViewController {
    
    @IBOutlet weak var namesTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeLastButton: UIButton!
    var namesArray = ["Roman","Elena","Anatoly","Andrey","Irina","Alexey","Alexandr","Gulnara","Zhenya","Alina","Anya","Yulia","Marina","Katya","Tamara"]
    var namesStack = MutableObservableArray<String>([])

    @IBOutlet weak var cTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        namesStack.bind(to: namesTableView) { (dataSourse, indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "namesCell") as! NamesTableViewCell
            cell.nameLable.text = dataSourse[indexPath.row]
            return cell
        }
        addButton.reactive.tap.observeNext {
            self.namesStack.insert(self.namesArray.randomElement()!, at: 0)
        }
        removeLastButton.reactive.tap.observeNext {
            if self.namesStack.count != 0 {
                self.namesStack.removeLast()
            } else {
                let alert = UIAlertController(title: "Ошибка!", message: "Разогнался! Нечего удалять!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ладно, ладно, извини", style: .destructive, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
}
