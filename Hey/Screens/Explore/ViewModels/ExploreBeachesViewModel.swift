//
//  ExploreBeachesViewModel.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 15.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import Services

final class ExploreBeachesViewModel {

  // MARK: - Properties

  private let beachesClient = BeachesClient(session: URLSession.shared)
  var beachCellViewModels: [BeachCellViewModel] = []

  // MARK: - UI

  var isLoading: Bool = false {
    didSet {
      showLoading?()
    }
  }

  var showLoading: (VoidClosure)?
  var reloadData: (VoidClosure)?
  var showError: ((Error) -> Void)?

  // MARK: - Helpers

  func fetchBeaches() {
    beachesClient.fetchBeachList { result in
      self.isLoading = true
      switch result {
      case .success(let beaches):
        self.beachCellViewModels = beaches.map { BeachCellViewModel($0) }
        self.isLoading = false
        self.reloadData?()
      case .failure(let error):
        print("Error: ", error)
        self.showError?(error)
      }
    }
  }
}
