//
//  Dish.swift
//  RestOrderAppHard
//
//  Created by Petar Perich on 22.10.2020.
//  Copyright © 2020 Petar Perich. All rights reserved.
//

import Foundation

struct Dish {
    var name: String
    var price: Int
    var amount: Int
    init( name: String, price: Int, amount: Int) {
          
          self.name = name
          self.price = price
          self.amount = amount
        
}

}
