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
    var slideList :[NSImage] = []
    var currentSlideNum : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let openPanel: NSOpenPanel = NSOpenPanel()
        openPanel.canChooseDirectories = true
        openPanel.canChooseFiles = false
        openPanel.allowsMultipleSelection = false
        openPanel.message = "choose file"

        openPanel.begin(completionHandler: { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                //image = NSImage(contentsOf: openPanel.url!)!
                //self.CurrentSlide.image = image
                let fileList: [URL] = self.getFileList(directoryPath: openPanel.url!)
                let sortedList = fileList.sorted(by: { $0.path < $1.path })
                for url in sortedList {
                    self.slideList.append(NSImage(contentsOf: url)!)
                }

                self.CurrentSlide.image = self.slideList[self.currentSlideNum]
            }
        })

        //let imagePath = "001"
        //let image = NSImage(imageLiteralResourceName: imagePath)
        //CurrentSlide.image = image
    }

    func getFileList(directoryPath: URL) -> [URL] {
        do {
            return try FileManager.default.contentsOfDirectory(
                    at: directoryPath,
                    includingPropertiesForKeys: nil,
                    options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles)
        } catch {
            print("Failed to access the directory")
            return []
        }
    }


    override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
    }


    override func keyUp(with event: NSEvent)
    {
        print(event.keyCode)
        if event.keyCode == 124 {
            currentSlideNum += 1
            CurrentSlide.image = slideList[currentSlideNum]
        } else if event.keyCode == 123 {
            currentSlideNum -= 1
            CurrentSlide.image = slideList[currentSlideNum]
        }
    }


}
