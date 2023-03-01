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
        var savedData = load() ?? []
        savedData.append(contentsOf: array)
        do {
            let encodedData = try JSONEncoder().encode(savedData)
            userDefaults.set(encodedData, forKey: key)
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
    func replace(saveModel: SaveModel, atIndex index: Int) {
        var savedData = load() ?? []
        guard index >= 0 && index < savedData.count else {
            return
        }
        savedData[index] = saveModel
        do {
            let encodedData = try JSONEncoder().encode(savedData)
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
    
    func isFirstLaunch() -> Bool {
        if let _ = userDefaults.string(forKey: "appLaunchedBefore") {
            return false
        } else {
            userDefaults.set(true, forKey: "appLaunchedBefore")
            return true
        }
    }

}


