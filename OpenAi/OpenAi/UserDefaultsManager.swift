//
//  UserDefaultsManager.swift
//  OpenAi
//
//  Created by hyd on 2023/2/25.
//

import Foundation

enum style:Codable {
    case question
    case answer
}

struct SaveModel:Codable {
    
    /// 提问
    let question:String
    
    /// 回复
    let answer:String
    
    /// 时间
    let creatTime:String
    
    /// 类型
//    let QAStyle:style
}


class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "savedData"
    
    func save(array: [SaveModel]) {
        do {
            let encodedData = try JSONEncoder().encode(array)
            userDefaults.set(encodedData, forKey: key)
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
    
    func load() -> [SaveModel]? {
        guard let savedData = userDefaults.data(forKey: key) else {
            return nil
        }
        do {
            let decodedData = try JSONDecoder().decode([SaveModel].self, from: savedData)
            return decodedData
        } catch {
            print("Error loading data: \(error.localizedDescription)")
            return nil
        }
    }
}


