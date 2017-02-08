//
//  FirstViewController.swift
//  iTFLS Seller
//
//  Created by x5 on 17/2/8.
//  Copyright © 2017年 yqszxx. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var price: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gatherAction(_ sender: Any) {
        let priceNum = atof(price.text!)
        print("Gathered \(priceNum)")
    }
}
