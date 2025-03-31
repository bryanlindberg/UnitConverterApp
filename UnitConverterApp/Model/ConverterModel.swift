//
//  ConverterModel.swift
//  UnitConverterApp
//
//  Created by Lindberg, Bryan R on 3/28/25.
//

import Foundation


struct ConverterModel {
    func convertLength(value: Double, startingUnit: String, convertingTo: String) -> Double {
        if startingUnit == "feet" && convertingTo == "miles" {
            return value / 5280
        }
        else if startingUnit == "miles" && convertingTo == "feet" {
            return value * 5280
        }
        else if startingUnit == "feet" && convertingTo == "meters" {
            return value / 3.28084
        }
        else if startingUnit == "meters" && convertingTo == "feet" {
            return value * 3.28084
        }
        else if startingUnit == "meters" && convertingTo == "miles" {
            return value / 1609.34
        }
        else if startingUnit == "miles" && convertingTo == "meters" {
            return value * 1609.34
        }
        else {
            return value
        }
    }
    
    func convertWeight(value: Double, startingUnit: String, convertingTo: String) -> Double {
        if startingUnit == "pounds" && convertingTo == "kilograms" {
            return value / 2.20462
        }
        else if startingUnit == "kilograms" && convertingTo == "pounds" {
            return value * 2.20462
        }
        else if startingUnit == "pounds" && convertingTo == "ounces" {
            return value * 16
        }
        else if startingUnit == "ounces" && convertingTo == "pounds" {
            return value / 16
        }
        else if startingUnit == "kilograms" && convertingTo == "ounces" {
            return value * 35.274
        }
        else if startingUnit == "ounces" && convertingTo == "kilograms" {
            return value / 35.274
        }
        else {
            return value
        }
    }
    
    func convertTemp(value: Double, startingUnit: String, convertingTo: String) -> Double {
        if startingUnit == "fahrenheit" && convertingTo == "celsius" {
            return (value - 32) * 5 / 9
        }
        else if startingUnit == "celsius" && convertingTo == "fahrenheit" {
            return value * 9 / 5 + 32
        }
        else if startingUnit == "fahrenheit" && convertingTo == "kelvin" {
            return (value - 32) * 5 / 9 + 273.15
        }
        else if startingUnit == "kelvin" && convertingTo == "fahrenheit" {
            return (value - 273.15) * 9 / 5 + 32
        }
        else if startingUnit == "kelvin" && convertingTo == "celsius" {
            return value - 273.15
        }
        else if startingUnit == "celsius" && convertingTo == "kelvin" {
            return value + 273.15
        }
        else {
            return value
        }
        
    }
    
    func convertSpeed(value: Double, startingUnit: String, convertingTo: String) -> Double {
        if startingUnit == "mph" && convertingTo == "km/h" {
            return value * 1.60934
        }
        else if startingUnit == "km/h" && convertingTo == "mph" {
            return value * 0.621371
        }
        else if startingUnit == "mph" && convertingTo == "m/s" {
            return value * 0.44704
        }
        else if startingUnit == "m/s" && convertingTo == "mph" {
            return value * 2.23694
        }
        else if startingUnit == "km/h" && convertingTo == "m/s" {
            return value * 0.277778
        }
        else if startingUnit == "m/s" && convertingTo == "km/h" {
            return value * 3.6
        }
        else {
            return value
        }
    }
}
