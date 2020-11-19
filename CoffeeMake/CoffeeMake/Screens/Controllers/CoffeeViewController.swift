//
//  ViewController.swift
//  CoffeeMake
//
//  Created by Роман Колосов on 19.11.2020.
//

import UIKit

class CoffeeViewController: UIViewController {
    
    @IBOutlet weak var coffeeSegmentControl: UISegmentedControl!
    @IBOutlet weak var syropSegmentControl: UISegmentedControl!
    @IBOutlet weak var sugarSegmentControl: UISegmentedControl!
    @IBOutlet weak var coffeLabel: UILabel!
    
    // Some properties
    private var selectedCoffee: Coffee {
        switch coffeeSegmentControl.selectedSegmentIndex {
        case 0:
            return .expresso
        case 1:
            return .cappuccino
        case 2:
            return .latte
        default:
            return .expresso
        }
    }
    private var selectedSyrop: Syrop {
        switch syropSegmentControl.selectedSegmentIndex {
        case 0:
            return .noSyrop
        case 1:
            return .caramel
        case 2:
            return .vanilla
        case 3:
            return .nuts
        default:
            return .noSyrop
        }
    }
    private var selectedSugar: Sugar {
        switch sugarSegmentControl.selectedSegmentIndex {
        case 0:
            return .noSugar
        case 1:
            return .normal
        case 2:
            return .double
        default:
            return .noSugar
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    // MARK: - Major Methods
    
    private func getKindCoffee() -> CoffeeSellable {
        let expresso = SimpleCoffee()
        
        switch selectedCoffee {
        case .expresso:
            return expresso
        case .cappuccino:
            return Cappuccino(base: expresso)
        case .latte:
            return Latte(base: expresso)
        }
    }
    
    private func getCoffeeWithSyrop(coffee: CoffeeSellable) -> CoffeeSellable {
        switch selectedSyrop {
        case .noSyrop:
            return coffee
        case .caramel, .vanilla, .nuts:
            return CoffeeWithSyropp(base: coffee)
        }
    }
    
    private func getCoffeeWithSugar(coffee: CoffeeSellable) -> CoffeeSellable {
        switch selectedSugar {
        case .noSugar:
            return coffee
        case .normal:
            return CoffeeWithSingleSugar(base: coffee)
        case .double:
            let coffeeWithSingleSugar = CoffeeWithSingleSugar(base: coffee)
            return CoffeeWithSingleSugar(base: coffeeWithSingleSugar)
        }
    }
    
    // MARK: - Actions

    @IBAction func getCoffee(_ sender: UIButton) {
        var coffee: CoffeeSellable
        
        coffee = getKindCoffee()
        coffee = getCoffeeWithSyrop(coffee: coffee)
        coffee = getCoffeeWithSugar(coffee: coffee)
        
        let coffeePrice = String(format: "%.2f", coffee.price)
        
        coffeLabel.text = "Your coffee for \(coffeePrice) bucks only"
    }
}

