//
//  CoffeMachine.swift
//  CoffeeMachine
//
//  Created by Alexandr on 12.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

class CoffeeMachine: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(coffeeBeansCapacity, forKey: "coffeeBeansCapacity")
        coder.encode(waterCapacity, forKey: "waterCapacity")
        coder.encode(milkCapacity, forKey: "milkCapacity")
        coder.encode(wasteCapacity, forKey: "wasteCapacity")
    }
    
    required init?(coder: NSCoder) {
        self.coffeeBeansCapacity = coder.decodeObject(forKey: "coffeeBeansCapacity") as! Double
        self.waterCapacity = coder.decodeObject(forKey: "waterCapacity") as! Double
        self.milkCapacity = coder.decodeObject(forKey: "milkCapacity") as! Double
        self.wasteCapacity = coder.decodeObject(forKey: "wasteCapacity") as! Double
    }
    
    // MARK: Costants for max capacity
    private let coffeeBeansMaxCapacity: Double = 0.0
    private let waterMaxCapacity: Double = 0.0
    private let milkMaxCapacity: Double = 0.0
    private let wasteMaxCapacity: Double = 0.0
    
    // MARK: Capacity
    @objc  var coffeeBeansCapacity: Double
    @objc private var waterCapacity: Double
    @objc private var milkCapacity: Double
    @objc private var wasteCapacity: Double
    
    init(coffeeBeansCapacity: Double, waterCapacity: Double, milkCapacity: Double, wasteCapacity: Double) {
        self.coffeeBeansCapacity = coffeeBeansCapacity
        self.waterCapacity = waterCapacity
        self.milkCapacity = milkCapacity
        self.wasteCapacity = wasteCapacity
    }
    
    func addCoffeeBeans(coffeeBeans: Double) {
        coffeeBeansCapacity += coffeeBeans
    }
}
