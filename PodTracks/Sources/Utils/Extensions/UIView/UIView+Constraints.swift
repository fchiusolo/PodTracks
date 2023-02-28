//
//  UIView+Constraints.swift
//  PodTracks
//
//  Created by Francesco Chiusolo on 28/02/23.
//

import UIKit

extension UIView {
  func constraint(to constraints: [NSLayoutConstraint]) {
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(constraints)
  }
}
