//
//  ViewController.swift
//  Homework 2
//
//  Created by Tipachel on 22.10.2021.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
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
    var ciColor: CIColor = CIColor()
    
    var delegate: SettingsVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorWindow.layer.cornerRadius = 10
        colorWindow.backgroundColor = currentColor
        
        
        if let colorInProgress = currentColor {
            ciColor = CIColor(color: colorInProgress)
        }
        
        changeSliders(with: ciColor)
        changeLabels(with: ciColor)
        changeTextFields(with: ciColor)
    }
   
    
    @IBAction func redSliderAction() {
        changeColor()
    }
    
    @IBAction func greenSliderAction() {
        changeColor()
    }
    
    @IBAction func blueSliderAction(_ sender: Any) {
        changeColor()
    }
    

    @IBAction func doneButtonPressed(_ sender: Any) {
        delegate.updateBackground(for: currentColor)
        dismiss(animated: true)
    }
    
    
    private func changeSliders(with ciColor: CIColor) {
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }

    private func changeLabels(with ciColor: CIColor) {
        redLabel.text = "Red: \(round(with: ciColor.red))"
        greenLabel.text = "Green: \(round(with: ciColor.green))"
        blueLabel.text = "Blue: \(round(with: ciColor.blue))"
    }
    
    private func changeTextFields(with ciColor: CIColor) {
        redTF.text = round(with: ciColor.red)
        greenTF.text = round(with: ciColor.green)
        blueTF.text = round(with: ciColor.blue)
    }
    
    
    func changeColor() {
        
        let tempRed = CGFloat(redSlider.value)
        let tempGreen = CGFloat(greenSlider.value)
        let tempBlue = CGFloat(blueSlider.value)
        
        currentColor = UIColor(red: tempRed, green: tempGreen, blue: tempBlue, alpha: 1.0)
        colorWindow.backgroundColor = currentColor
        
        let newCiColor = CIColor(color: currentColor!)
        
        changeLabels(with: newCiColor)
        changeTextFields(with: newCiColor)
        changeSliders(with: newCiColor)
        
    }
    
    private func round(with value: CGFloat) -> String {
        String.localizedStringWithFormat("%.1F", value)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }

}


extension SettingsViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard var value = Float(textField.text ?? "") else {
            showAlert(title: "Incorrect simbols", message: "Check input value!")
            return true }
        
        if value < 0 {
            showAlert(title: "Incorrect value",
                      message: "Minimum value will be set")
            value = 0
        } else if value > 1 {
            showAlert(title: "Incorrect value",
                      message: "Maximum value will be set")
            value = 1
        }
        
        let fieldValue = CGFloat(value)
        
        switch textField.tag {
        case 0:
            redSlider.value = Float(fieldValue)
        case 1:
            greenSlider.value = Float(fieldValue)
        case 2:
            blueSlider.value = Float(fieldValue)
        default:
            break
        }
        
        textField.text = round(with: fieldValue)
        
        changeColor()
        
        return true
    }
}

