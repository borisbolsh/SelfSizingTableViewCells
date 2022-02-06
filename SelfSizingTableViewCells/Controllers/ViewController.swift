import UIKit

class ViewController: UIViewController {

  private let tableView = UITableView()
  private let posts: [Posts] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
  }

}

// MARK: Setup view
extension ViewController {
  private func setupUI() {
    view.addSubview(tableView)
    tableView.frame = view.bounds

    tableView.delegate = self
    tableView.dataSource = self

    tableView.register(PostCell.self, forCellReuseIdentifier: String(describing: PostCell.self))
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 340

  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostCell.self), for: indexPath) as! PostCell

    cell.configurate(title: "John Doe Sample Title", description: "Test test test Test test test Test test test Test test test Test test test Test test test Test test test Test test test Test test test Test test test Test test test Test test test Test test test Test test test Test test test Test test test Test test test")
    return cell
  }


}

extension ViewController: UITableViewDelegate {}
