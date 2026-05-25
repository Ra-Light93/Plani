//
//  Manger.swift
//  Plani
//
//  Created by Raad Amar on 10.05.25.
//

import Foundation
import UIKit

struct MangerTAVC {
    var deleget : TrackerAlertViewController?
    
    func AddItmeToRoutineDict()->String{
 
        let ImageData: Data? = nil
        
        guard let title = deleget?.RoutineNamePlaceHolder.text?.trimmingCharacters(in: .whitespaces), !title.isEmpty
              else {return k.ReturnStringsOfAlert.TextFailed}
        
        guard let amount = deleget?.RoutineAmountPlaceHolder.text, !amount.isEmpty , Float(amount) != nil
              else {return k.ReturnStringsOfAlert.AmountFailed}
        
        guard let extention = deleget?.RoutineExtentionPlaceHolder.text, !extention.isEmpty
              else {return k.ReturnStringsOfAlert.ExtentionFailed}
        
        let newItem = RoutineItem(
            _title:     title,
            _extention: extention,
            _amount:    amount,
            _imageData: ImageData)
        
        if let key = deleget?.RoutineNamePlaceHolder.text {
            Datastructur.RoutineDict[key] = newItem
        }
        return k.ReturnStringsOfAlert.Done
    }

}

//Action Elements
//@IBOutlet weak var RoutineNamePlaceHolder: UITextField!
//@IBOutlet weak var RoutineAmountPlaceHolder: UITextField!
//@IBOutlet weak var RoutineExtentionPlaceHolder: UITextField!
//@IBOutlet weak var UploadButtonFotoRoutine: UIButton!
//
////Example Elements
//@IBOutlet weak var ExampleRoutineImage: UIImageView!
//@IBOutlet weak var ExampleRoutineLabel: UILabel!
