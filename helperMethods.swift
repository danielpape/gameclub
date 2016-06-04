//
//  helperMethods.swift
//  tranquilLondon
//
//  Created by Daniel Pape on 14/03/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit

class helperMethods: NSObject {
    
    func makeImageRound(image:UIImageView){
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.whiteColor().CGColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
    
    func makeStringLowerCaseAndRemoveNonAlphanumberic(string:String) -> String{
        let charactersToRemove = NSCharacterSet.alphanumericCharacterSet().invertedSet
        let strippedSplit:NSArray = string.componentsSeparatedByCharactersInSet(charactersToRemove)
        let joined = strippedSplit.componentsJoinedByString("").lowercaseString
        return joined
    }
}
