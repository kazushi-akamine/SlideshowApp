//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by Maitoparta on 2019/09/28.
//  Copyright © 2019 paruobro. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var image1: UIImage!
   
    
    @IBOutlet weak var secondView: UIImageView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       secondView.image = self.image1
        }

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


