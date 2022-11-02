//
//  LoginResponseModel.swift
//  NetworkingAPI
//
//  Created by Arman Akash on 29/10/22.
//

import Foundation

struct LoginResponseModel: Codable {
    let status, accessToken, refreshToken: String?
}
