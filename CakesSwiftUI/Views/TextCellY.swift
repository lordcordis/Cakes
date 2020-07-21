//
//  TextCellY.swift
//  CakesSwiftUI
//
//  Created by Wheatley on 21.07.2020.
//  Copyright © 2020 Wheatley. All rights reserved.
//

import SwiftUI

struct TextCellY: View {
    
    let item: ItemTextViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("hz").font(.headline)
            HStack {
                Text(item.text).font(.subheadline)
                Spacer()
            }
        }.padding().background(Color.yellow).cornerRadius(8)
    }
}
