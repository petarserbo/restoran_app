//
//  ViewController.swift
//  RestOrderAppHard
//
//  Created by Petar Perich on 22.10.2020.
//  Copyright © 2020 Petar Perich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trashButtonOutlet: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var orderStack: UIStackView!
    
    var dishes: [Dish] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        inputNewDish()
        
    }
    
    @IBAction func trashButtonPressed(_ sender: Any) {
        dishes.removeAll()
        orderStack.arrangedSubviews.forEach {$0.removeFromSuperview()}
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        let dishItem = dishes
        
        performSegue(withIdentifier: "ToTheBill", sender: dishItem)
    }
    
    func inputNewDish () {
        let alert = UIAlertController(title: "Добавьте новое блюдо", message: "", preferredStyle: .alert)
        let addMagic = UIAlertAction(title: "Добавить", style: .default) { (action) in
            let nameField =  alert.textFields![0]
            let priceField = alert.textFields![1]
            let price = Int(priceField.text!)!
            let amountField = alert.textFields![2]
            let amount = Int(amountField.text!)!
            
            self.addNewDish(with: nameField.text!, andPrice: price, with: amount)
            
        }
        
        addMagic.isEnabled = false
        let cancelButton = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        alert.addTextField { (textField) in
            textField.placeholder = "Название блюда"
            
        }
        
        alert.addTextField { (textField) in
            
            textField.placeholder = "Цена"
            textField.keyboardType = .numberPad
            
        }
        
        alert.addTextField  { (textField) in
            textField.placeholder = "Количество"
            textField.keyboardType = .numberPad
            
            
            NotificationCenter.default.addObserver(forName :UITextField.textDidChangeNotification, object: textField, queue: OperationQueue.main) { (notification) -> Void in
                addMagic.isEnabled = textField.text!.count > 0
                
            }
            
        }
        
        alert.addAction(addMagic)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
        
    }
    
    func addNewDish(with name: String, andPrice price: Int, with amount:Int) {
        let dish = Dish(name: name, price: price, amount: amount)
        
        self.dishes.append(dish)
        let label = UILabel()
        label.text = "\(dish.name) \(price) x \(amount)"
        
        
        orderStack.addArrangedSubview(label)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToTheBill" {
            guard let secondVC = segue.destination as? BillViewController,
                  let dishItem = sender as? [Dish]
            else {
                fatalError("wrong")
            }
            
            secondVC.finalPrice = dishItem
            
        }
        
    }
    
}
