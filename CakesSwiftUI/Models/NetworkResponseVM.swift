
//
//  NetworkResponseViewModel.swift
//  CakesSwiftUI
//
//  Created by Wheatley on 21.07.2020.
//  Copyright © 2020 Wheatley. All rights reserved.
//

import Foundation

// MARK: - NetworkResponseViewModel

enum ItemTypeViewModel: String {
    case hz, picture, selector
}

struct ItemViewModelStruct: Identifiable {
    var id = UUID().uuidString
    var name: ItemTypeViewModel
    var data: ItemViewModelProtocol
    
    static let testStruct = ItemViewModelStruct(name: ItemTypeViewModel.hz, data: ItemTextViewModel(itemData: TestItems.itemData))
}

struct ItemTextViewModel: ItemViewModelProtocol {
    let text: String
    
    
    init(itemData: ItemData) {
        self.text = itemData.text ?? ""
    }
}

struct ItemPictureViewModel: ItemViewModelProtocol {
    let text: String
    let url: String
    
    init(itemData: ItemData) {
        self.text = itemData.text ?? ""
        self.url = itemData.url ?? ""
    }
}

struct ItemSelectorViewModel: ItemViewModelProtocol {
    let selectedID: Int
    let variants: [SelectorDataViewModel]
    
    init(itemData: ItemData) {
        self.selectedID = itemData.selectedID ?? 0
        
        let itemDataArray = itemData.variants ?? []
        var selectorArray: [SelectorDataViewModel] = []
        for i in itemDataArray {
            selectorArray.append(SelectorDataViewModel(selectorData: i))
        }
        variants = selectorArray
    }
}

struct SelectorDataViewModel {
    
    init(selectorData: SelectorData) {
        self.id = selectorData.id
        self.text = selectorData.text
    }
    let id: Int
    let text: String
}


protocol ItemViewModelProtocol {
    init(itemData: ItemData)
}
