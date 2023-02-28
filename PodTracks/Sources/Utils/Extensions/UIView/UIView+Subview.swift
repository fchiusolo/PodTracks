//
//  UIView+Subview.swift
//  PodTracks
//
//  Created by Francesco Chiusolo on 28/02/23.
//

import UIKit

extension UIView {
  func addSubview(_ subview: UIView, usingConstraints constraints: [NSLayoutConstraint]) {
    addSubview(subview)
    subview.constraint(to: constraints)
  }
}
