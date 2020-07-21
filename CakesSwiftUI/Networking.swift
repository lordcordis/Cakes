//
//  Networking.swift
//  CakesSwiftUI
//
//  Created by Wheatley on 14.07.2020.
//  Copyright © 2020 Wheatley. All rights reserved.
//

import Foundation
import Combine


final class Networking: ObservableObject {
    
    static var shared = Networking()
    
    @Published var results: NetworkResponse? = nil
    
    let urlString = "https://pryaniky.com/static/json/sample.json"
    let jsondec = JSONDecoder()
    var cancellable: AnyCancellable?
    
    
    init() {
        GetData()
    }
    
    func GetData (){
        cancellable = Request().sink(receiveCompletion: { _ in
            
        }, receiveValue: { cellcontents in
            print(cellcontents)
            self.results = cellcontents
        })
        
    }
    
    func Request() -> AnyPublisher<NetworkResponse, Error> {
        return URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
            .map { $0.data }
            .decode(type: NetworkResponse.self, decoder: jsondec)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
