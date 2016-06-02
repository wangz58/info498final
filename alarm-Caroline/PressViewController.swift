//
//  ViewController.swift
//  finalProject
//
//  Created by apple on 5/30/16.
//  Copyright © 2016 Sophie. All rights reserved.
//

import UIKit
import AVFoundation

class PressViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var button: UIButton!
    var random : Int = 0
    var pressed : Int = 0
    var backgroundMusicPlayer = AVAudioPlayer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        random = Int(arc4random_uniform(20)) + 40
        text.text = "Please press the button for \(random) times!"
        playBackgroundMusic("longalarm.mp3")
    }
    
    func playBackgroundMusic(filename: String) {
        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOfURL: newURL)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        pressed = pressed + 1
        text.text = "Please press the button for \(random - pressed) times!"
        if (pressed == random) {
            button.enabled = false
            backgroundMusicPlayer.stop()
            self.view.backgroundColor = UIColor.greenColor()
        } else {
            self.view.backgroundColor = UIColor.redColor()
        }
    }

}

