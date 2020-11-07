//
//  ViewController.swift
//  Exercise
//
//  Created by Rivi Elf on 05/11/2020.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    var interactor: InteractorProtocol?

    @IBAction func BtnPressed(_ sender: UIButton) {
        interactor?.refreshButtonPressed()
    }
}
