//
//  BillViewController.swift
//  RestOrderAppHard
//
//  Created by Petar Perich on 23.10.2020.
//  Copyright © 2020 Petar Perich. All rights reserved.
//

import UIKit
import RealmSwift

class BillViewController: UIViewController {
    
    @IBOutlet weak var tipAmount10: UILabel!
    @IBOutlet weak var tipAmount5: UILabel!
    @IBOutlet weak var finalPriceOutlet: UILabel!
    var finalPrice: Results<Dish>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }

    private func configure () {
        finalPriceOutlet.text = "\(totalCost)"
        let amount5: Int = Int(Float(totalCost) * 0.05)
        tipAmount5.text = "\(amount5)"
        let amount10: Int = Int(Float(totalCost) * 0.1)
        tipAmount10.text = "\(amount10)"
        
    }
    var totalCost: Int {
        var sum = 0
        for dish in finalPrice {
            sum += dish.price * dish.amount
            
        }
        
        return sum
    }
    
    
}
