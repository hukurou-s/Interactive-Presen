//
//  ViewController.swift
//  Interactive-Presen
//
//  Created by 石井怜央 on 2018/06/18.
//  Copyright © 2018 LEO. All rights reserved.
//

import Cocoa
import Foundation

class ViewController: NSViewController {

    @IBOutlet weak var CurrentSlide: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        let imagePath = "001"
        let image = NSImage(imageLiteralResourceName: imagePath)
        CurrentSlide.image = image
    }


    override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
    }


}
