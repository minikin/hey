//
//  Keychain.swift
//  Services
//
//  Created by Sasha Prokhorenko on 17.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//
// Abstract:
// A struct for accessing generic token keychain items.

public struct UserKey {
  public static let email = "userEmail"
}

struct KeychainConfiguration {
  static let serviceName = "HeyApp"
  static let accessGroup: String? = nil
}

public struct Keychain {
  public static func saveToken(_ userEmail: String, token: String) {
    do {
      // This is a new account, create a new keychain item with the account name.
      let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                              account: userEmail,
                                              accessGroup: KeychainConfiguration.accessGroup)
      // Save the token for the new item.
      try passwordItem.savePassword(token)
    } catch {
      fatalError("Error updating keychain - \(error)")
    }
  }

  public static func readToken(_ userEmail: String) -> String {
    do {
      let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                              account: userEmail,
                                              accessGroup: KeychainConfiguration.accessGroup)
      let keychainToken = try passwordItem.readPassword()
      return keychainToken
    } catch {
      fatalError("Error reading token from keychain - \(error)")
    }
  }

  public static func removeToken(_ userEmail: String) {
    do {
      let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                              account: userEmail,
                                              accessGroup: KeychainConfiguration.accessGroup)
      try passwordItem.deleteItem()
    } catch {
      fatalError("Error deleting token from keychain - \(error)")
    }
  }
}
