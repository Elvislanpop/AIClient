//
//  ResponseModel.swift
//  OpenAi
//
//  Created by hyd on 2023/2/22.
//

import Foundation

struct Response: Codable {
    let message: Message
}

struct Message: Codable {
    let id: String
    let role: String
    let content: Content
}

struct Content: Codable {
    let content_type: String
    let parts: [String]
}

