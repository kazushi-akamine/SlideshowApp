//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Maitoparta on 2019/09/28.
//  Copyright © 2019 paruobro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    let images = [UIImage(named: "gaikan.jpg"), UIImage(named: "tennai1.jpg"), UIImage(named: "tennai2.jpg")]
    
    var imageIndex: Int = 0
    
    var timer: Timer!
    
    @IBAction func next(_ sender: Any) {
        if self.timer != nil {
        } else if imageIndex < 1 {
            imageIndex += 1
        } else if imageIndex < 2 {
            imageIndex += 1
        } else if imageIndex < 3 {
            imageIndex -= 2
        }
        imageView.image = images[imageIndex]
    }
    
    @IBAction func back(_ sender: Any) {
        if self.timer != nil {
        } else if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        imageView.image = images[imageIndex]
    }
    
    @IBAction func startStop(_ sender: Any) {
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        } else {
            timer.invalidate()
            self.timer = nil
        }
    }
    @objc func updateTimer(_ timer: Timer){
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = images[imageIndex]
    }
    
    @IBAction func tapImage(_ sender: Any) {
         performSegue(withIdentifier: "Second", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "Second" {
            
            let secondView = segue.destination as! SecondViewController
            secondView.image1 = images[imageIndex]
        }
    }
   
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

