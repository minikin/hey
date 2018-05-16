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

  private let client: ApiClient
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

  init(_ client: ApiClient) {
    self.client = client
  }

  // MARK: - Helpers

  func fetchBeaches(_ page: Int = 0, refresh: Bool = false) {
    if let client = client as? ExpoloreBeachesAPI {
      self.isLoading = true
      client.fetchBeachList(page) { result in
        switch result {
        case .success(let beaches):
          if refresh {
            self.beachCellViewModels = beaches.map { BeachCellViewModel($0) }
          } else {
            let newBeachCellViewModels = beaches.map { BeachCellViewModel($0) }
            self.beachCellViewModels.append(contentsOf: newBeachCellViewModels)
          }
          print(self.beachCellViewModels.count)
          self.isLoading = false
          self.reloadData?()
        case .failure(let error):
          print("Error: ", error)
          self.showError?(error)
        }
      }
    }
  }
}
