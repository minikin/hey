//
//  ApiRouter.swift
//  Services
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

public enum ApiRouter: URLRequestConvertible {
    case signUpUser(email: String, password: String)
    case signInUser(email: String, password: String)
    case readUser(token: String)
    case logOutUser(token: String)
    case readBeaches(page: Int)
    case image(imagePath: String)

    public static let baseURLString = "http://techtest.lab1886.io:3000/"

    var method: HTTPMethod {
        switch self {
        case .signUpUser, .signInUser:
            return .post
        case .logOutUser:
            return .delete
        case .readBeaches, .readUser, .image:
            return .get
        }
    }

    var path: String {
        switch self {
        case .signUpUser:
            return "user/register"
        case .signInUser:
            return "user/login"
        case .readUser:
            return "user/me"
        case .logOutUser:
            return "user/logout"
        case .readBeaches:
            return "beaches"
        case let .image(imagePath):
            return "\(imagePath)"
        }
    }

    var url: URL? {
        let url = URL(string: ApiRouter.baseURLString)!

        switch self {
        case let .readBeaches(page):
            guard var components = URLComponents(url: url.appendingPathComponent(path),
                                                 resolvingAgainstBaseURL: false) else {
                return nil
            }
            components.queryItems = [URLQueryItem(name: "page", value: page.description)]
            return components.url
        default:
            return url.appendingPathComponent(path)
        }
    }

    public func asURLRequest() throws -> URLRequest {
        guard let finalUrl = url else {
            throw ApiError.invalidURL(url: url)
        }
        var request = URLRequest(url: finalUrl)
        request.httpMethod = method.rawValue
        request.addValue("no-cache", forHTTPHeaderField: "Cache-Control")

        switch self {
        case let .signInUser(email, password), let .signUpUser(email, password):
            let bodyParameters = [
                "email": "\(email)",
                "password": "\(password)",
            ]
            let bodyString = bodyParameters.queryParameters
            request.httpBody = bodyString.data(using: .utf8, allowLossyConversion: true)
        case let .logOutUser(token), let .readUser(token):
            request.addValue(token, forHTTPHeaderField: "x-auth")
        default:
            break
        }

        return request
    }
}
