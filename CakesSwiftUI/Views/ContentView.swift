//
//  ContentView.swift
//  CakesSwiftUI
//
//  Created by Wheatley on 14.07.2020.
//  Copyright © 2020 Wheatley. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView: View {
    let networking = Networking()
    
    @State var cells: [ItemViewModelStruct] = [ItemViewModelStruct.testStruct]
    @State var textToDisplayInAlert = ""
    @State var alertIsDisplayed = false
    
    var body: some View {
        NavigationView {
            List(cells) { cellVM in
                if cellVM.name == ItemTypeViewModel.hz {
                    TextCellY(item: cellVM.data as! ItemTextViewModel).onTapGesture {
                        self.textToDisplayInAlert = String("Sender: \(cellVM.name.rawValue)")
                        self.alertIsDisplayed = true
                    }
                } else if cellVM.name == ItemTypeViewModel.selector {
                    SelectorCell(item: cellVM.data as! ItemSelectorViewModel)
                } else if cellVM.name == ItemTypeViewModel.picture {
                    PictureCell(item: cellVM.data as! ItemPictureViewModel).onTapGesture {
                        self.textToDisplayInAlert = String("Sender: \(cellVM.name.rawValue)")
                        self.alertIsDisplayed = true
                    }
                }
            }.navigationBarTitle("Pryaniky test API")
        }
        .onAppear {
            let presenter = DataPresenter(networking: self.networking, delegate: self)
            presenter.getData()
        }
        .alert(isPresented: $alertIsDisplayed) {
            Alert(title: Text(textToDisplayInAlert))
        } 
    }
}

extension ContentView: DataPresenterDelegate {
    func render(cells: [ItemViewModelStruct]) {
        self.cells = cells
        print(cells)
    }
    
}
