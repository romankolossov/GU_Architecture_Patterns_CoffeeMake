//
//  SimpleCoffee.swift
//  CoffeeMake
//
//  Created by Роман Колосов on 19.11.2020.
//

import Foundation

protocol CoffeeSellable {
    var price: Float { get }
}

class SimpleCoffee: CoffeeSellable {
    var price: Float {
        return 3.00
    }
}
