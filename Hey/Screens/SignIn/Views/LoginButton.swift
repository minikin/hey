//
//  LoginButton.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

final class LoginButton: UIButton {
  let activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    return activityIndicator
  }()

  let activityBackgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
    return view
  }()

  var isActive: Bool = false {
    didSet {
      isUserInteractionEnabled = !isActive
      if isActive && !oldValue { showActivityIndicator() }
      if !isActive && oldValue { hideActivityIndicator() }
    }
  }

  private func showActivityIndicator() {
    if !clipsToBounds { clipsToBounds = true }

    activityBackgroundView.frame = bounds
    addSubview(activityBackgroundView)

    addSubview(activityIndicator)
    addConstraints([
      centerXAnchor.constraint(equalTo: activityIndicator.centerXAnchor),
      centerYAnchor.constraint(equalTo: activityIndicator.centerYAnchor)
    ])

    activityIndicator.startAnimating()
  }

  private func hideActivityIndicator() {
    activityIndicator.stopAnimating()
    activityIndicator.removeFromSuperview()
    activityBackgroundView.removeFromSuperview()
  }
}
