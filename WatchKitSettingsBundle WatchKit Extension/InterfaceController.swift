//
//  InterfaceController.swift
//  WatchKitSettingsBundle WatchKit Extension
//
//  Created by Patrick Balestra on 09/02/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var label: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        loadFontSize()
        NotificationCenter.default.addObserver(self, selector: #selector(InterfaceController.loadFontSize), name: UserDefaults.didChangeNotification, object: nil)
        
    }
    
    override func didDeactivate() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func loadFontSize() {
        let preferencesUserDefaults = UserDefaults(suiteName: "group.patrickbalestra.watchkitsettingsbundle.preferences")
        if (preferencesUserDefaults?.value(forKey: "fontSize") as? String) != nil {
            let fontSize = CGFloat((preferencesUserDefaults?.value(forKey: "fontSize") as! NSString).floatValue)
            let attributedString = NSAttributedString(string: "This is a label example with a font size of \(fontSize).", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: fontSize)])
            label.setAttributedText(attributedString)
        }
    }
    
}
