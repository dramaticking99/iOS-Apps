//
//  WelcomeViewController.swift
//  FlashChat
//
//  Created by Chetan Sanwariya on 02/02/24.
//

import UIKit
 
class WelcomeViewController: UIViewController {

    @IBOutlet weak var textlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let labelText = "⚡️FlashChat"
        textlabel.text = ""
        var num: Double = 0
        for letter in labelText {
            
            Timer.scheduledTimer(withTimeInterval: 0.1 * num, repeats: false) { timer in
                self.textlabel.text = self.textlabel.text! + String(letter)
            }
            
            num += 1
            
        }
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
