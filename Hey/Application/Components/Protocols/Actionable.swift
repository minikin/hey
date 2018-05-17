//
//  Actionable.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 12.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

/// The actionable protocol works in conjunction with __Sourcery__ __actionable.swifttemplate__ with
/// the purpose to simplify a way of creation of delegate pattern.
protocol Actionable: class {
    associatedtype ActionType
    associatedtype Delegate

    func notify(_ action: ActionType)
}

extension Actionable {
    func notify(_ action: ActionType) -> () -> Void {
        return { [weak self] in
            self?.notify(action)
        }
    }
}
