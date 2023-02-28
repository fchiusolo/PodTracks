//
//  Reusable.swift
//  PodTracks
//
//  Created by Francesco Chiusolo on 28/02/23.
//

import Foundation

protocol Reusable {
  static var reuseID: String { get }
}

extension Reusable {
  static var reuseID: String {
    "\(String(describing: Self.self))ReuseID"
  }
}
