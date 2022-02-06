import UIKit

class ViewController: UIViewController {

  private let tableView = UITableView()
  private var posts: [Post] = []

  private let networkService: NetworkService

  init(networkService: NetworkService) {
    self.networkService = networkService
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
    fetchPosts()
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

extension ViewController {
  func fetchPosts() {
    let request = PostsRequest()
    networkService.request(request) { [weak self] result in
      switch result {
      case .success(let posts):
        self?.posts = posts
        DispatchQueue.main.async {
          self?.tableView.reloadData()
        }
      case .failure(let error):
        print(error)
      }
    }
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostCell.self), for: indexPath) as! PostCell

    cell.configurate(
      title: posts[indexPath.row].title,
      description: posts[indexPath.row].body
    )
    return cell
  }


}

extension ViewController: UITableViewDelegate {}
