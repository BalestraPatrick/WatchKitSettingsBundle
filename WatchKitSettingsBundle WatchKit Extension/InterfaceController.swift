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
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        loadFontSize()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadFontSize", name: NSUserDefaultsDidChangeNotification, object: nil)
        
    }
    
    func loadFontSize() {
        let preferencesUserDefaults = NSUserDefaults(suiteName: "group.patrickbalestra.watchkitsettingsbundle.preferences")
        let fontSize = CGFloat((preferencesUserDefaults?.valueForKey("fontSize") as NSString).floatValue)
        let attributedString = NSAttributedString(string: "This is a label example with a font size of \(fontSize).", attributes: [NSFontAttributeName : UIFont.systemFontOfSize(fontSize)])
        label.setAttributedText(attributedString)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
 
    }

}
