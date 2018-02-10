//
//  ViewController.swift
//  Timer
//
//  Created by Ruth on 09/02/18.
//  Copyright © 2018 Ruth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!

    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var labelCounter: UILabel!
    
    var counter : Double = 0
    var timer = Timer()
    var isrunning = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.applyDesgin()
        pauseButton.applyDesgin()
        resetButton.applyDesgin()
        labelCounter.text = "\(counter)"
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
    }

    @IBAction func start(_ sender: Any) {
        if !isrunning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
            startButton.isEnabled = false
            pauseButton.isEnabled = true
            resetButton.isEnabled = true
            isrunning = true
        }
        
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        isrunning = false
        
    }
    
    @IBAction func reset(_ sender: Any) {
        timer.invalidate()
        counter = 0
        labelCounter.text = "\(counter)"
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        isrunning = false
        
    }
    
    @objc func updateTimer(){
        counter += 0.1
        labelCounter.text = String(format: "%.1f", counter)
        
        
    }
}
extension UIButton {
    func applyDesgin()   {
        //self.layer.shadowColor = UIColor.darkGray.cgColor
        //self.layer.shadowOpacity = 0.5
        //self.layer.shadowRadius = 1
        self.layer.cornerRadius = self.frame.width / 2
    }
    
}
