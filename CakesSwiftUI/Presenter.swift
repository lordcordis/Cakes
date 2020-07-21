//
//  Presenter.swift
//  CakesSwiftUI
//
//  Created by Wheatley on 16.07.2020.
//  Copyright © 2020 Wheatley. All rights reserved.
//

import Foundation

class DataPresenter: DataPresenterProtocol {
    
    var networking: Networking
    var delegate: DataPresenterDelegate?
    
    init(networking: Networking, delegate: DataPresenterDelegate) {
        self.networking = networking
        self.delegate = delegate
    }
    
    var output: [ItemData] = []
    
    func getData() {
        networking.GetData()
        
        guard let results = networking.results else {return}
        
        var getDataLocalOutput: [Item] = []
        var itemViewModelOutput: [ItemViewModelStruct] = []
//        var isSelected = 0
        
        let itemNames = results.data.map {
            $0.name
        }
        
        for view in results.view {
            for itemName in itemNames {
                if view == itemName {
                    let itemToAppend = results.data.filter { item in
                        item.name == itemName
                    }
                    getDataLocalOutput.append(contentsOf: itemToAppend)

                }
            }
        }
        
        func itemToItemViewModelStruct (item: Item) -> ItemViewModelStruct {
            var itemvVM: ItemViewModelStruct?
            
            switch item.name {
            case "hz":
                itemvVM = ItemViewModelStruct(name: ItemTypeViewModel.hz, data: ItemTextViewModel(itemData: item.data))
            case "picture":
                itemvVM = ItemViewModelStruct(name: ItemTypeViewModel.picture, data: ItemPictureViewModel(itemData: item.data))
            case "selector":
                itemvVM = ItemViewModelStruct(name: ItemTypeViewModel.selector, data: ItemSelectorViewModel(itemData: item.data))
            default:
                break
            }
            
            return itemvVM ?? ItemViewModelStruct.testStruct
            
        }
        
        for item in getDataLocalOutput {
    
            let itemVMtoExport = itemToItemViewModelStruct(item: item)
            print(item)
            itemViewModelOutput.append(itemVMtoExport)
            
        }
        self.delegate?.render(cells: itemViewModelOutput)
    }
}

