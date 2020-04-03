import UIKit
import Bond
import ReactiveKit

class ViewController: UIViewController {
    
    private let homeworks = ["Задача A","Задача B","Задача C","Задача D","Задача E"]
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
            let vc = storyboard!.instantiateViewController(identifier: "aHomeWork") as! AViewController
            present(vc, animated: true)
        case 1:
            let vc = storyboard!.instantiateViewController(identifier: "bHomeWork") as! BViewController
            present(vc, animated: true)
        case 2:
            let vc = storyboard!.instantiateViewController(identifier: "cHomeWork") as! CViewController
            present(vc, animated: true)
        case 3:
            let vc = storyboard!.instantiateViewController(identifier: "dHomeWork") as! DViewController
            present(vc, animated: true)
        case 4:
        let vc = storyboard!.instantiateViewController(identifier: "eHomeWork") as! EViewController
        present(vc, animated: true)
        default:
            let alert = UIAlertController()
            alert.addAction(UIAlertAction(title: "Error!", style: .destructive, handler: nil))
            present(alert, animated: true)
        }
    }
}
