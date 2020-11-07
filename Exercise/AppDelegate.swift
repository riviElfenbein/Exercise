//
//  AppDelegate.swift
//  Exercise
//
//  Created by Rivi Elf on 05/11/2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var applicationCoordinator: ApplicationCoordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        applicationCoordinator = ApplicationCoordinator(window: window)
        applicationCoordinator?.start()
        return true
    }
}








