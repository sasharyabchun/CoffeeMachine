//
//  TabBarController.swift
//  CoffeeMachine
//
//  Created by Alexandr on 13.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var coffeeMachine: CoffeeMachine?
    
    var mainController: MainViewController?  {
        var mController: MainViewController?
        
        viewControllers?.forEach({ (viewController) in
        if viewController is MainViewController {
            mController = viewController as? MainViewController
        }})
        
        return mController
    }
    
    var profileController: ProfileViewController?  {
        var pController: ProfileViewController?
        
        viewControllers?.forEach({ (viewController) in
        if viewController is ProfileViewController {
            pController = viewController as? ProfileViewController
        }})
        
        return pController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coffeeMachine = getCoffeeMachine()
        mainController?.coffeeMachine = coffeeMachine
        profileController?.coffeeMachine = coffeeMachine
    }
    
    
    private func getCoffeeMachine() -> CoffeeMachine? {
        let decodedData = UserDefaults.standard.object(forKey: "coffeeMachine") as! Data
        
        do {
            return try NSKeyedUnarchiver.unarchivedObject(ofClass: CoffeeMachine.self, from: decodedData)
        } catch  {
            // Init
            return CoffeeMachine(coffeeBeansCapacity: Double.random(in: 0...1000), waterCapacity: 0, milkCapacity: 0, wasteCapacity: 0)
        }
    }

    deinit {
        saveCoffeeMachine(coffeeMachine: coffeeMachine)
    }
    
    private func saveCoffeeMachine(coffeeMachine: CoffeeMachine?){
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
