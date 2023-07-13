//
//  ViewController.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/13.
//

import UIKit

class HomeVC: UIViewController {

    @IBAction func searchButtonTapped(_ sender: Any) {
       goRestaurantRecommendation(controller: self)
    }
    @IBAction func selectLocalTapped(_ sender: Any) {
       goAddressSearch(controller: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


    }


}

