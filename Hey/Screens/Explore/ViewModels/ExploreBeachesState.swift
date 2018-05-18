//
//  ExploreBeachesState.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 15.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services

final class ExploreBeachesState {

    // MARK: - Properties

    private let client: ApiClient
    private(set) var beachCellItems: [BeachCellItem] = []
    var showLoading: VoidClosure?
    var reloadDataOnSuccess: VoidClosure?
    var showError: ((Error) -> Void)?

    var isLoading: Bool = false {
        didSet {
            showLoading?()
        }
    }

    // MARK: - Initialisation

    init(_ client: ApiClient) {
        self.client = client
    }

    // MARK: - Helpers

    func fetchBeaches(_ page: Int = 0) {
        if let client = client as? ExpoloreBeachesAPI {
            if page == 0 { isLoading = true }
            client.fetchBeachList(page) { result in
                switch result {
                case let .success(beaches):
                    let newBeaches = beaches.map { BeachCellItem($0) }
                    self.beachCellItems.append(contentsOf: newBeaches)
                    self.isLoading = false
                    self.reloadDataOnSuccess?()
                case let .failure(error):
                    print("Error: ", error)
                    self.showError?(error)
                }
            }
        }
    }
}
