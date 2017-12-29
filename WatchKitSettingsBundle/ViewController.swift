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
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.loadFontSize), name: UserDefaults.didChangeNotification, object: nil)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func loadFontSize() {
        let fontSizes = ["12", "14", "16", "18"]
        let preferencesUserDefaults = UserDefaults(suiteName: "group.patrickbalestra.watchkitsettingsbundle.preferences")
        if let fontSize = preferencesUserDefaults?.value(forKey: "fontSize") as? String {
            segmentedControl.selectedSegmentIndex = fontSizes.index(of: fontSize)!
//                find(fontSizes, fontSize as! String)!
        }
    }
    
    @IBAction func preferenceChanged(sender: UISegmentedControl) {
        let preferencesUserDefaults = UserDefaults(suiteName: "group.patrickbalestra.watchkitsettingsbundle.preferences")
        preferencesUserDefaults?.set(sender.titleForSegment(at: sender.selectedSegmentIndex), forKey: "fontSize")
    }

}

