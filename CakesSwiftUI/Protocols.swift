//
//  Protocols.swift
//  CakesSwiftUI
//
//  Created by Wheatley on 20.07.2020.
//  Copyright © 2020 Wheatley. All rights reserved.
//

import Foundation

protocol DataPresenterProtocol {
    func getData()
}

protocol DataPresenterDelegate {
    func render(cells: [ItemViewModelStruct])
}
