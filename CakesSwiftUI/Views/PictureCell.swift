//
//  PictureCell.swift
//  CakesSwiftUI
//
//  Created by Wheatley on 20.07.2020.
//  Copyright © 2020 Wheatley. All rights reserved.
//

import SwiftUI

struct PictureCell: View {
    let item: ItemPictureViewModel
    var body: some View {
        HStack {
            ImageView(urlString: item.url).frame(width: 40, height: 40)
            Divider().fixedSize()
            Text(item.text)
            Spacer()
            }.padding().background(Color.yellow).cornerRadius(8)
    }
}
