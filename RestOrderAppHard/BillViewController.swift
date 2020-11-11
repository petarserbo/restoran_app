//
//  BillViewController.swift
//  RestOrderAppHard
//
//  Created by Petar Perich on 23.10.2020.
//  Copyright © 2020 Petar Perich. All rights reserved.
//

import UIKit

class BillViewController: UIViewController {

    @IBOutlet weak var tipAmount10: UILabel!
    @IBOutlet weak var tipAmount5: UILabel!
    @IBOutlet weak var finalPriceOutlet: UILabel!
    var finalPrice: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    @IBAction func countTipButton(_ sender: UIButton) {
        
        let amount5: Int = Int(Float(totalCost) * 0.05)
        tipAmount5.text = "\(amount5)"
        let amount10: Int = Int(Float(totalCost) * 0.1)
        tipAmount10.text = "\(amount10)"
        
    }
    
    @IBAction func clearLabelsButton(_ sender: UIButton) {
        tipAmount5.text = "-"
        tipAmount10.text = "-"
        finalPriceOutlet.text = "Счёт"
        finalPrice.removeAll()
        
       
        
    }
    private func configure () {
   
        finalPriceOutlet.text = "\(totalCost)"
     
}
    var totalCost: Int {
    var sum = 0
                  
    for dish in finalPrice {
                  
               
sum += dish.price * dish.amount
                      
                   
              }
    return sum
}


}
