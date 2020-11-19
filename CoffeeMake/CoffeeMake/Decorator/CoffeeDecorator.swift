//
//  CoffeeDecorator.swift
//  CoffeeMake
//
//  Created by Роман Колосов on 19.11.2020.
//

import Foundation

protocol CoffeDecoratorValueIncreasable: CoffeeSellable {
    var baseCoffee: CoffeeSellable { get }
    
    init(base: CoffeeSellable)
}

// Cappuccino
class Cappuccino: CoffeDecoratorValueIncreasable {
    var price: Float {
        return baseCoffee.price + 1.00
    }
    var baseCoffee: CoffeeSellable

    required init(base: CoffeeSellable) {
        self.baseCoffee = base
    }
}

// Latte
class Latte: CoffeDecoratorValueIncreasable {
    var price: Float {
        return baseCoffee.price + 2.00
    }
    var baseCoffee: CoffeeSellable

    required init(base: CoffeeSellable) {
        self.baseCoffee = base
    }
}

// CoffeeWithSyropp
class CoffeeWithSyropp: CoffeDecoratorValueIncreasable {
    var price: Float {
        return baseCoffee.price + 1.50
    }
    var baseCoffee: CoffeeSellable

    required init(base: CoffeeSellable) {
        self.baseCoffee = base
    }
}

// CoffeeWithSingleSugar
class CoffeeWithSingleSugar: CoffeDecoratorValueIncreasable {
    var price: Float {
        return baseCoffee.price + 0.50
    }
    var baseCoffee: CoffeeSellable

    required init(base: CoffeeSellable) {
        self.baseCoffee = base
    }
}
