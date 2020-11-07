//
//   InteractorArticels.swift
//  Exercise
//
//  Created by Rivi Elf on 06/11/2020.
//

import Foundation
protocol InteractorArticelsProtocol {
    var info: Articels{ get set}
    var networking:NetworkingWorker { get set}
    var numberOfRows: Int {get}
    func titelForRow(index: Int) -> String
    func imageUrlFor(index: IndexPath, completion: @escaping (Data?, IndexPath) -> ())

}

class InteractorArticels: InteractorArticelsProtocol {
    var info: Articels
    var networking: NetworkingWorker
    var numberOfRows: Int{
        info.data.count
    }
    
    init(info: Articels,
         networking: NetworkingWorker) {
        self.info = info
        self.networking = networking
    }
    
    func titelForRow(index: Int) -> String {
        return self.info.data[index].title
    }
    
    func imageUrlFor(index: IndexPath, completion: @escaping (Data?, IndexPath) -> ()) {
        let path = self.info.data[index.row].imageUrl
        networking.loadImage(path: path){ data in
            completion(data, index)
        }
    }
    
    
}




