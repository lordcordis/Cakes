//
//  SelectorCell.swift
//  CakesSwiftUI
//
//  Created by Wheatley on 18.07.2020.
//  Copyright © 2020 Wheatley. All rights reserved.
//

import SwiftUI

struct SelectorCell: View {
    
    let item: ItemSelectorViewModel
    @State var selected: Int = 2
    @State var alertIsPresented = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(ItemTypeViewModel.selector.rawValue)").font(.headline)
            Picker(selection: $selected, label: Text("\(ItemTypeViewModel.selector.rawValue)")) {
                ForEach(0..<item.variants.count) { variant in
                    Text(self.item.variants[variant].text).tag(variant).onTapGesture {
                        print("selected")
                    }
                }.onAppear {
                    self.selected = self.item.selectedID
                }
            }.pickerStyle(SegmentedPickerStyle()).padding()
                .onTapGesture {
                    self.alertIsPresented = true
            }
        }
        .alert(isPresented: $alertIsPresented) {
            Alert(title: Text("sender: \(item.variants[selected].text)"))
        }
        .padding().background(Color.yellow).cornerRadius(8)
    }
}
