//
//  DetailViewController.swift
//  pruebaMarvel
//
//  Created by ruben on 08/03/2021.
//  Copyright © 2021 ruben. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var name: String?
    var descriptiontxt: String?
    var imageHero: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = name
        descriptionLabel.text = descriptiontxt
        photo.image = imageHero
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
