//
//  Account.swift
//  Services
//
//  Created by Sasha Prokhorenko on 17.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

public struct Account: Codable {

    // MARK: - Properties

    public let accessToken: String

    // MARK: - Initialisation

    public init(_ accessToken: String) {
        self.accessToken = accessToken
    }
}
