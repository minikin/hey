//
//  ExpoloreBeachesAPI.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services

class ExpoloreBeachesAPI: ApiClient {
  func fetchBeachList(_ page: Int = 1, completion: @escaping ApiComplitionBlock<[Beach]>) {
    let url = URL(string: "http://techtest.lab1886.io:3000/beaches?page=\(page)")!
    let request = URLRequest(url: url)
    get(with: request, completion: completion)
  }
}
