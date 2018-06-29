//
//  ViewController.swift
//  FortuneTeller
//
//  Created by 林奕德 on 2018/3/23.
//  Copyright © 2018年 AppsAdamLin. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox
class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool{      //狀態列隱藏
        return true
    }
    
    @IBOutlet weak var yorFortune: UIImageView!
    @IBAction func tellMeSomething(_ sender: UIButton) {
        showAnswer()
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake{
            showAnswer()
        }
    }
    func showAnswer() {
        if yorFortune.isHidden == true{
            //show me the answer
            //1.make a number 1~6
            let answer = GKRandomSource.sharedRandom().nextInt(upperBound: 6)+1 // 1~6
            
            //2.change image
            yorFortune.image = UIImage(named:"\(answer)")
            yorFortune.isHidden = false
           
            //3.sound
             AudioServicesPlayAlertSound(1000)
        }else{
            //hide  me the answer
            yorFortune.isHidden = true
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

