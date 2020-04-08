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
        addButton.reactive.tap.observeNext { [weak self] in
            self?.namesStack.insert(self?.namesArray.randomElement()! ?? "", at: 0)
        }
        addButton.reactive.longPressGesture(numberOfTaps: 0, numberOfTouches: 1, minimumPressDuration: 0.2, allowableMovement: 5).observeNext { (ltpg) in
            self.namesStack.insert(self.namesArray.randomElement()!, at: 0)
        }
        removeLastButton.reactive.longPressGesture(numberOfTaps: 0, numberOfTouches: 1, minimumPressDuration: 0.5, allowableMovement: 5).observeNext { (lpg) in
            if lpg.state == .began {
                let alert = UIAlertController(title: "Внимание", message: "Удалить всё?", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { (_) in
                    return
                }))
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                    self.namesStack.removeAll()
                }))
                self.present(alert, animated: true)
            }
        }
        
        removeLastButton.reactive.tap.observeNext { [weak self] in
            if self?.namesStack.count != 0 {
                self?.namesStack.removeLast()
            } else {
                let alert = UIAlertController(title: "Ошибка!", message: "Разогнался! Нечего удалять!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ладно, ладно, извини", style: .destructive, handler: nil))
                self?.present(alert, animated: true)
            }
        }
    }
    deinit {
        print("CViewController---")
    }
}
