import UIKit

class ViewController: UIViewController {

  let auteurs = Auteur.auteursFromBundle()
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
   
  }


}

