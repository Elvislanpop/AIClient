//
//  SaveModel.swift
//  OpenAi
//
//  Created by hyd on 2023/2/25.
//

import Foundation

struct SaveModel:Codable {
    
    /// 提问
    let question:String
    
    /// 回复
    let answer:String
    
    /// 时间
    let creatTime:String
}
