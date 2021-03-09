//
//  InitialViewController.swift
//  pruebaMarvel
//
//  Created by ruben on 08/03/2021.
//  Copyright © 2021 ruben. All rights reserved.
//

import UIKit
import Alamofire

class InitialViewController: UIViewController {
    
    @IBAction func entryButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let listController = storyBoard.instantiateViewController(identifier: "ListTableViewController") as! ListTableViewController
        listController.modalPresentationStyle = .fullScreen
        self.present(listController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "capi.jpg")!))
        

        // Do any additional setup after loading the view.
    }
    
      
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
