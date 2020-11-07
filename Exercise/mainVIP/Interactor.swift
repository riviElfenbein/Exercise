//
//  Interactor.swift
//  Exercise
//
//  Created by Rivi Elf on 06/11/2020.
//

import Foundation

protocol InteractorProtocol {
     var presenter: PresenterProtocol? { get set}
     var networking: NetworkingWorker { get set }
     var router: Coordinator {get set}
     func refreshButtonPressed()
}

class Interactor: InteractorProtocol {
    var router: Coordinator
    var presenter: PresenterProtocol?
    var networking: NetworkingWorker
    
    init(networking: NetworkingWorker, router: Coordinator) {
        self.router = router
        self.networking = networking
    }
    func refreshButtonPressed() {
        //presenter should display loading request
        // request networking response with clusure
        getArticels{ response in
           //request transion to next screen with the data
            self.router.moveToNextScreen(info: response)
        }
       
    }
    
    func getArticels(completion: @escaping (Articels) -> Void) {
        networking.performNetworkTask(endpoint: "https://cdn.theculturetrip.com/home-assignment/response.json", type:Articels.self, completion: { response in
            completion(response)
        })
    }
    
   
}
