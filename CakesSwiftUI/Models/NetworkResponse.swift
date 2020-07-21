//
//  NetworkResponse.swift
//  CakesSwiftUI
//
//  Created by Wheatley on 14.07.2020.
//  Copyright © 2020 Wheatley. All rights reserved.
//

import Foundation



// MARK: - NetworkResponse
struct NetworkResponse: Codable {
    let data: [Item]
    let view: [String]
}

struct Item: Codable {
    var name: String
    let data: ItemData
}

struct ItemData: Codable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [SelectorData]?
    
    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
    }
}

struct SelectorData: Codable {
    let id: Int
    let text: String
}








struct TestItems {
    static let selectorData = [SelectorData(id: 1, text: "ww"), SelectorData(id: 2, text: "wwa")]
    static let itemData = ItemData(text: "connect to network", url: "url", selectedID: 1, variants: selectorData)
    static let TestItemText = Item(name: "network error", data: itemData)
}

