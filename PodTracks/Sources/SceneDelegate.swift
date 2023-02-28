//
//  SceneDelegate.swift
//  PodTracks
//
//  Created by Francesco Chiusolo on 28/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else {
      return
    }
    bootstrapScene(windowScene, with: UIViewController())
  }
}

private extension SceneDelegate {
  func bootstrapScene(_ scene: UIWindowScene, with rootViewController: UIViewController) {
    window = UIWindow(frame: scene.coordinateSpace.bounds)
    window?.windowScene = scene
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
  }
}
