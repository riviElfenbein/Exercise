////
////  ApplicationCordinator.swift
////  Exercise
////
////  Created by Rivi Elf on 05/11/2020.
////
//
import UIKit

protocol Coordinator {
    func start()
    func moveToNextScreen<T>(info: T)
}


class ApplicationCoordinator: Coordinator {
  
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController = UINavigationController()
    let networking = NetworkingWorker()
    
    var window: UIWindow?
   
    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        let vc = ViewController.instantiate()
        
        let interactor =  Interactor(networking: networking, router: self)
        interactor.presenter = vc
        vc.interactor = interactor
        navigationController.pushViewController(vc, animated: false)
        
        // create a basic UIWindow and activate it
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func moveToNextScreen<T>(info: T){
        let vc = ArticelsViewController.instantiate()
        let interactor =  InteractorArticels(info: info as! Articels, networking: networking)
        //interactor.presenter = vc
        vc.interactor = interactor
        DispatchQueue.main.async {
            self.navigationController.pushViewController(vc, animated: false)
        }
       
    }
}
