//
//  UIStackView+ArrangedSubviews.swift
//  PodTracks
//
//  Created by Francesco Chiusolo on 28/02/23.
//

import UIKit

extension UIStackView {
  func addArrangedSubviews(_ subviews: UIView...) {
    subviews.forEach(addArrangedSubview)
  }
}
