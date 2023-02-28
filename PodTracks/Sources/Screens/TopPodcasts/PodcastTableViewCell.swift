//
//  PodcastTableViewCell.swift
//  PodTracks
//
//  Created by Francesco Chiusolo on 28/02/23.
//

import UIKit

final class PodcastTableViewCell: UITableViewCell {
  private lazy var horizontalStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [coverImageView, verticalStackView])
    stackView.axis = .horizontal
    stackView.distribution = .fill
    stackView.alignment = .top
    stackView.spacing = 8
    return stackView
  }()

  private lazy var coverImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private lazy var verticalStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [primaryLabel, secondaryLabel])
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .leading
    stackView.spacing = 4
    return stackView
  }()

  private lazy var primaryLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = .preferredFont(forTextStyle: .headline)
    return label
  }()

  private lazy var secondaryLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .preferredFont(forTextStyle: .subheadline)
    return label
  }()

  override func prepareForReuse() {
    coverImageView.image = nil
    primaryLabel.text = nil
    secondaryLabel.text = nil
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    layoutContentView()
    layoutImageView()
  }

  private func layoutContentView() {
    contentView.addSubview(horizontalStackView, usingConstraints: [
      horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      contentView.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor, constant: 16),
      contentView.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 16),
    ])
  }

  private func layoutImageView() {
    coverImageView.constraint(to: [
      coverImageView.heightAnchor.constraint(equalToConstant: 50),
      coverImageView.widthAnchor.constraint(equalToConstant: 50),
    ])
  }

  func update(image: UIImage?) {
    coverImageView.image = image
  }

  func update(primaryText text: String?) {
    primaryLabel.text = text
  }

  func update(secondaryText text: String?) {
    secondaryLabel.text = text
  }
}

extension PodcastTableViewCell: Reusable {}
