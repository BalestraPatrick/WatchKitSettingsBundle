//
//  ViewController.swift
//  WatchKitSettingsBundle
//
//  Created by Patrick Balestra on 09/02/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFontSize()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadFontSize", name: NSUserDefaultsDidChangeNotification, object: nil)

    }
    
    func loadFontSize() {
        let fontSizes = ["12", "14", "16", "18"]
        let preferencesUserDefaults = NSUserDefaults(suiteName: "group.patrickbalestra.watchkitsettingsbundle.preferences")
        let fontSize = preferencesUserDefaults?.valueForKey("fontSize") as String
        segmentedControl.selectedSegmentIndex = find(fontSizes, fontSize)!;
    }
    
    @IBAction func preferenceChanged(sender: UISegmentedControl) {
        let preferencesUserDefaults = NSUserDefaults(suiteName: "group.patrickbalestra.watchkitsettingsbundle.preferences")
        preferencesUserDefaults?.setObject(sender.titleForSegmentAtIndex(sender.selectedSegmentIndex), forKey: "fontSize")
    }

}

