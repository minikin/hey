//
//  ExpoloreBeachesAPI.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services

final class ExpoloreBeachesAPI: ApiClient {
    func fetchBeachList(_ page: Int = 0, completion: @escaping ApiComplitionBlock<[Beach]>) {
        guard let request = ApiRouter.readBeaches(page: page).urlRequest else {
            fatalError("Can't build request to read beaches!")
        }
        getListOfItems(with: request, completion: completion)
    }
}
