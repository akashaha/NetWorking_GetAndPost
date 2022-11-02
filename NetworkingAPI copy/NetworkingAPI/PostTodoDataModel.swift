//
//  PostTodoDataModel.swift
//  NetworkingAPI
//
//  Created by Arman Akash on 29/10/22.
//

import Foundation

struct PostDataModel: Codable {
    let text:  String?
}

struct PostDataResponseModel: Codable {
    let status: String?
}
