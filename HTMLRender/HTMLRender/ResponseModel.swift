//
//  ResponseModel.swift
//  HTMLRender
//
//  Created by Fahim Rahman on 19/10/22.
//

import Foundation

// MARK: - RESPONSE MODEL
struct PostResponseModel: Codable {
    let title, body, userId: String
    let id: Int
}
