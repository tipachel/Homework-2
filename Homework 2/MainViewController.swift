//
//  MainViewController.swift
//  Homework 2
//
//  Created by Tipachel on 06.11.2021.
//

import UIKit

protocol SettingsVCDelegate: AnyObject {
    
    func updateBackground(for currentBackground: UIColor?)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsVC = segue.destination as? SettingsViewController {
            settingsVC.currentColor = view.backgroundColor
            settingsVC.delegate = self
        }
    }
}

extension MainViewController: SettingsVCDelegate {
    
    func updateBackground(for currentBackground: UIColor?) {
        view.backgroundColor = currentBackground
    }
}





