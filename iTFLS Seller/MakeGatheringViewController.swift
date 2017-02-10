//
//  MakeGatheringViewController.swift
//  iTFLS Seller
//
//  Created by x5 on 17/2/9.
//  Copyright © 2017年 yqszxx. All rights reserved.
//

import UIKit

class MakeGatheringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneAction(segue: UIStoryboardSegue) {
        let sourceViewController = segue.source
        sourceViewController
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
