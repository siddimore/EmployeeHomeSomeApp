//
//  ViewController.swift
//  EmployeeAppHomeSome
//
//  Created by Siddharth More on 1/23/17.
//  Copyright © 2017 Siddharth More. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var skipButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var orderList:Array<DummyData> = Array()
    var skippedItems: Array<DummyData> = Array()
    var data:DummyData? = nil

    @IBOutlet weak var groceryName: UILabel!
    @IBOutlet weak var groceryQuantity: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        createData()
        print (self.orderList[0].itemName! + "," + self.orderList[0].quantity!)
        self.groceryName.text = self.orderList[0].itemName
        self.groceryQuantity.text = self.orderList[0].quantity

        
        if(orderList.isEmpty) {
            doneButton?.isEnabled = false
            skipButton?.isEnabled = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Done button tapped
    @IBAction func doneTapped(_ sender: Any) {
        
        showAlertViewWithController()
    }
    
    // Skip Button tapped
    @IBAction func skipTapped(_ sender: Any) {
        skippedItems.append(updateOrderList()!)
        
    }

    
    func randQuantity (lower: UInt32 , upper: UInt32) -> String {
        return String( lower + arc4random_uniform(upper - lower + 1))
    }
    
    // TODO: Remove after adding API end point to get data
    func genRandomString() -> String {
        
        let charactersString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let charactersArray = Array(arrayLiteral: charactersString)
        
        var itemName = ""
        for _ in 0..<5 {
            itemName += charactersArray[Int(arc4random()) % charactersArray.count]
        }

        return itemName
    
    }

    // TODO:Change to API end pt which populates the ordersList
    func createData() {
        
        for _ in 0..<10 {
        orderList.append(DummyData(inputName: "New Grocery", inputQuantity: randQuantity(lower: 0, upper: 10) + "lbs"))
        }
    }
    
    // function to update orderlist array
    // set the labels
    func updateOrderList() -> DummyData? {
        
        if(!orderList.isEmpty) {
        let item = orderList.remove(at: 0)
        self.groceryName.text = orderList[0].itemName
        self.groceryQuantity.text = orderList[0].quantity
        return item
        }
        return nil
    }
    
    // func to show alertcontroller asking user to validate entered quantity
    func showAlertViewWithController(inputMessage:String = "Please input your Quantity:") {
        
        let alertController = UIAlertController(title: "Quantity?", message: inputMessage, preferredStyle: .alert)
            //"Please input your Quantity:", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields![0] as? UITextField {
                // store your data
                 print (field.text)
                if (field.text?.isEmpty == true || field.text != self.orderList[0].quantity) {
                    self.showAlertViewWithController(inputMessage: "Recheck the Quantity and Enter again")
                }
                else {
                    
                    print ("Entered number: " + field.text!)
                    self.updateOrderList()
                }
               
//                UserDefaults.standard.set(field.text, forKey: "userEmail")
//                UserDefaults.standard.synchronize()
            } else {
                // user did not fill field
                
            }
        }
        
        _ = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Quantity"
        }
        
        alertController.addAction(confirmAction)
        //alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }

}

