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
        var image = NSImage()

        let openPanel: NSOpenPanel = NSOpenPanel()
        openPanel.canChooseDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowsMultipleSelection = false
        openPanel.message = "choose file"

        openPanel.begin(completionHandler: { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                image = NSImage(contentsOf: openPanel.url!)!
                self.CurrentSlide.image = image
            }
        })

        //let imagePath = "001"
        //let image = NSImage(imageLiteralResourceName: imagePath)
        //CurrentSlide.image = image
    }



    override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
    }


    override func keyUp(with event: NSEvent)
    {
        print(event.keyCode)
    }


}
