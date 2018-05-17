//
//  Beachswift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

public struct Beach: Codable {

  // MARK: - Properties
  
  let id: String
  public let name: String
  public let imagePath: String
  public let imageHeight: String

  // MARK: - CodingKeys

  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case name = "name"
    case imagePath = "url"
    case imageHeight = "height"
  }
}
