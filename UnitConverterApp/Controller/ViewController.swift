//
//  ViewController.swift
//  UnitConverterApp
//
//  Created by Lindberg, Bryan R on 3/28/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var valueTextBox: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var conversionPickerView: UIPickerView!
    @IBOutlet weak var reverseSwitch: UISwitch!
    
    let converter = ConverterModel()
    //pickerview options
    let conversionType = ["Length (Feet<->Miles)",
                          "Length (Feet<->Meters)",
                          "Length (Meters<->Miles)",
                          "Weight (Pounds<->Kilograms)",
                          "Weight (Pounds<->Ounces)",
                          "Weight (Kilograms<->Ounces)",
                          "Temp (Fahrenheit<->Celsius)",
                          "Temp (Fahrenheit<->Kelvin)",
                          "Temp (Kelvin<->Celsius)",
                          "Speed (mph<->km/h)",
                          "Speed (mph<->m/s)",
                          "Speed (km/h<->m/s)"]
    //dictionary to interpret the values from the pickerview input
    let unitDictionary: [String: (String, String)] = [
        "Length (Feet<->Miles)": ("feet", "miles"),
        "Length (Feet<->Meters)": ("feet", "meters"),
        "Length (Meters<->Miles)": ("meters", "miles"),
        "Weight (Pounds<->Kilograms)": ("pounds", "kilograms"),
        "Weight (Pounds<->Ounces)": ("pounds", "ounces"),
        "Weight (Kilograms<->Ounces)": ("kilograms", "ounces"),
        "Temp (Fahrenheit<->Celsius)": ("fahrenheit", "celsius"),
        "Temp (Fahrenheit<->Kelvin)": ("fahrenheit", "kelvin"),
        "Temp (Kelvin<->Celsius)": ("kelvin", "celsius"),
        "Speed (mph<->km/h)": ("mph", "km/h"),
        "Speed (mph<->m/s)": ("mph", "m/s"),
        "Speed (km/h<->m/s)": ("km/h", "m/s")
    ]
    
    //instantiation of the default value
    var selectedConversion = "Length (Feet<->Miles)"
   
    
    override func viewDidLoad() {
        displayLabel.isHidden = true
        reverseSwitch.isOn = false
        super.viewDidLoad()
        conversionPickerView.delegate = self
        conversionPickerView.dataSource = self
    }

    
    
    @IBAction func resetButton(_ sender: UIButton) {
        valueTextBox.text = ""
        displayLabel.text = ""
        reverseSwitch.isOn = false
    }
    
    
    @IBAction func convertButton(_ sender: UIButton) {
        displayLabel.isHidden = false
        //error handling + unit assignment
        guard let enteredValue = Double(valueTextBox.text ?? "") else {
            displayLabel.text = "Invalid Input"
            return
        }
        guard var units = unitDictionary[selectedConversion] else {
            displayLabel.text = "Error"
            return
        }
        
        //handles the reverse button being pressed with a simple swapping problem
        let isReversed = reverseSwitch.isOn
        if isReversed {
            let temp = units.0
            units.0 = units.1
            units.1 = temp
        }
        //calls the method to choose a conversion method
        let convertedValue = convertValue(value: enteredValue, startingUnit: units.0, convertingTo: units.1)
        displayLabel.text = String(format: "%.2f", convertedValue)
        
    }
    //sends the value to the proper conversion method
    func convertValue(value: Double, startingUnit: String, convertingTo endingValue: String) -> Double {
        if ["feet", "meters", "miles"].contains(startingUnit) {
            return converter.convertLength(value: value, startingUnit: startingUnit, convertingTo: endingValue)
        }
        else if ["celsius", "fahrenheit", "kelvin"].contains(startingUnit) {
            return converter.convertTemp(value: value, startingUnit: startingUnit, convertingTo: endingValue)
        }
        else if ["pounds", "kilograms", "ounces"].contains(startingUnit) {
            return converter.convertWeight(value: value, startingUnit: startingUnit, convertingTo: endingValue)
        }
        else if ["km/h", "mph", "m/s"].contains(startingUnit) {
            return converter.convertSpeed(value: value, startingUnit: startingUnit, convertingTo: endingValue)
        }
        else {
            return value
        }
    }
    
    
}

//I don't know why this is a separate class, I just saw it in a tutorial video and it's the only thing that didn't cause errors.
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return conversionType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return conversionType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedConversion = conversionType[row]
    }
    
}


