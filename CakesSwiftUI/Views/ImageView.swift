//
//  ImageView.swift
//  CakesSwiftUI
//
//  Created by Wheatley on 20.07.2020.
//  Copyright © 2020 Wheatley. All rights reserved.
//

import SwiftUI
//import UIKit

struct ImageView: View {
    
    let urlString: String
    @State var imageY = UIImage(named: "imageLoading")!
    
    
    var body: some View {
        Image(uiImage: imageY)
            .resizable().scaledToFit()
            .onAppear {
                if let url = URL(string: self.urlString) {
                    if let data = try? Data(contentsOf: url) {
                        if let image = UIImage(data: data){
                            self.imageY = image
                        }
                    }
                }
        }
    }
}

