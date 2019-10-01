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
    @IBOutlet weak var next1: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var startStop: UIButton!
    
    
    let images = [UIImage(named: "gaikan.jpg"), UIImage(named: "tennai1.jpg"), UIImage(named: "tennai2.jpg")]
    
    var imageIndex = 0
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = images[imageIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "Second" {
            
            let secondView = segue.destination as! SecondViewController
            secondView.image1 = images[imageIndex]
            if self.timer == nil{
            } else {
                timer.invalidate()
                self.timer = nil
                startStop.setTitle("再生", for: .normal)
                next1.isEnabled = true
                back.isEnabled = true
            }
        }
    }

   
    @IBAction func next1(_ sender: Any) {
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
        startStop.setTitle("停止", for: .normal)
        if self.timer == nil{
            next1.isEnabled = false
            back.isEnabled = false
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        } else {
            startStop.setTitle("再生", for: .normal)
            timer.invalidate()
            self.timer = nil
            next1.isEnabled = true
            back.isEnabled = true
            
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
    
   
   
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
}

