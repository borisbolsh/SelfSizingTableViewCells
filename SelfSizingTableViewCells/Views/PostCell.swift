import UIKit

final class PostCell: UITableViewCell {

  private let textTitle: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    return label
  }()

  private let textDescription: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(textTitle)
    contentView.addSubview(textDescription)
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    let padding: CGFloat = 16
    
    textTitle.frame = CGRect(
      x: padding,
      y: padding,
      width: frame.size.width - (padding * 2),
      height: textTitle.frame.height
    )

    textDescription.frame = CGRect(
      x: padding,
      y: (textTitle.frame.origin.y + textTitle.frame.size.height) + padding,
      width: frame.size.width - (padding * 2),
      height: textDescription.frame.height
    )
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
