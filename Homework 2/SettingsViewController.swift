//
//  ViewController.swift
//  Homework 2
//
//  Created by Tipachel on 22.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var colorWindow: UIView!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var currentColor: UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorWindow.layer.cornerRadius = 10
        colorWindow.backgroundColor = currentColor
        
    }
    func changeColor(){
        colorWindow.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    func changeValueForLabel(){
        redLabel.text = "Red:    \(round(redSlider.value * 10) / 10)"
        greenLabel.text = "Green: \(round(greenSlider.value * 10) / 10)"
        blueLabel.text = "Blue:   \(round(blueSlider.value * 10) / 10)"
    }
    
    @IBAction func redSliderAction(_ sender: Any) {
        changeColor()
        changeValueForLabel()
    }
    @IBAction func greenSliderAction(_ sender: Any) {
        changeColor()
        changeValueForLabel()
    }
    @IBAction func blueSliderAction(_ sender: Any) {
        changeColor()
        changeValueForLabel()
    }
    
}


