//
//  ViewController.swift
//  Dicee
//
//  Created by Chetan Sanwariya on 27/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LeftImageView: UIImageView!
    @IBOutlet weak var RightImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LeftImageView.image = UIImage(named: "dice3")
        RightImageView.image = UIImage(named: "dice4")
        
        
        
    }
    
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        
        var images = [UIImage(named: "dice1"),UIImage(named: "dice2"),UIImage(named: "dice3"),UIImage(named: "dice4"),UIImage(named: "dice5"),UIImage(named: "dice6")]
        
        LeftImageView.image = images[Int.random(in: 0...5)]
        RightImageView.image = images[Int.random(in: 0...5)]
        
    }
    

}

