//
//  ViewController.swift
//  CoffeeMachine
//
//  Created by Alexandr on 11.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var coffeeMachine: CoffeeMachine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getCoffeeMachine()
    }
    
    private func getCoffeeMachine() {
        let decodedData = UserDefaults.standard.object(forKey: "coffeeMachine") as! Data
        
        do {
            coffeeMachine = try NSKeyedUnarchiver.unarchivedObject(ofClass: CoffeeMachine.self, from: decodedData)
        } catch  {
            // Init
            coffeeMachine = CoffeeMachine(coffeeBeansCapacity: Double.random(in: 0...1000), waterCapacity: 0, milkCapacity: 0, wasteCapacity: 0)
        }
    }

    @IBAction func coffeeTypePressed(_ sender: UIButton) {
        print(coffeeMachine?.coffeeBeansCapacity)
        coffeeMachine?.addCoffeeBeans(coffeeBeans: 10)
    }
    
    deinit {
        saveCoffeeMachine()
    }
    
    private func saveCoffeeMachine(){
        guard let coffeeMachine = coffeeMachine else {
            return
        }
        
        do {
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: coffeeMachine, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: "coffeeMachine")
        } catch {
            return
        }
    }
    
}



