import UIKit

final class PostCell: UITableViewCell {
  private struct CellConstants {
    static let paddingTop: CGFloat = 16.0
    static let paddingLeft: CGFloat = 16.0
    static let paddingRight: CGFloat = -16.0
    static let paddingBottom: CGFloat = -16.0
  }

  private let textTitle: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    return label
  }()

  private let textDescription: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  private func setup() {
    contentView.addSubview(textTitle)
    contentView.addSubview(textDescription)
    contentView.clipsToBounds = true

    textTitle.translatesAutoresizingMaskIntoConstraints = false
    textDescription.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      textTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CellConstants.paddingTop),
      textTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellConstants.paddingLeft),
      textTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CellConstants.paddingRight),

      textDescription.topAnchor.constraint(equalTo: textTitle.bottomAnchor, constant: CellConstants.paddingTop),
      textDescription.leadingAnchor.constraint(equalTo: textTitle.leadingAnchor),
      textDescription.trailingAnchor.constraint(equalTo: textTitle.trailingAnchor),
      textDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: CellConstants.paddingBottom),
    ])

  }

  override func prepareForReuse() {
    super.prepareForReuse()
    textTitle.text = nil
    textDescription.text = nil
  }

  func configurate(title: String, description: String) {
    textTitle.text = title
    textDescription.text = description

    print("title is \(title) dest is \(description)")
  }

}
