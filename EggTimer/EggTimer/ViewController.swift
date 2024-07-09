//
//  ViewController.swift
//  EggTimer
//
//  Created by Chetan Sanwariya on 12/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var ProgressView: UIProgressView!
    
    var eggTime = ["Soft": 30 , "Medium": 50, "Hard": 70]
    var timePassed = 0;
    var timeTaken = 0;
    var timer = Timer();
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        var hardness = sender.titleLabel?.text
        print(hardness!)
        timeTaken = eggTime[hardness!]!
        print(timeTaken)
        
        ProgressView.progress = 0.0
        TextView.text = hardness
        
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer) , userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if timePassed < timeTaken {
            print(timePassed)
            timePassed += 1;
            
            ProgressView.progress = Float(timePassed)/Float(timeTaken)
        } else {
            print("timer is over")
            timePassed = 0;
            TextView.text = "DONE!"
            timer.invalidate()
        }
    }
    
    
}

