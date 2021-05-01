//
//  Dish.swift
//  RestOrderAppHard
//
//  Created by Petar Perich on 22.10.2020.
//  Copyright © 2020 Petar Perich. All rights reserved.
//

import Foundation
import RealmSwift

class Dish: Object {

    
    @objc dynamic var name: String = ""
    @objc dynamic var price: Int = 0
    @objc dynamic var amount: Int = 0
    
//   convenience init(name: String, price: Int, amount: Int){
//    self.init()
//        self.name = name
//        self.price = price
//        self.amount = amount
//    }

}
