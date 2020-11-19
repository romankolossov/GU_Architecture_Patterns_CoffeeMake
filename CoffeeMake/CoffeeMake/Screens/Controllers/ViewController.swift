//
//  ViewController.swift
//  CoffeeMake
//
//  Created by Роман Колосов on 19.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
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
        // Do any additional setup after loading the view.
    }


}

