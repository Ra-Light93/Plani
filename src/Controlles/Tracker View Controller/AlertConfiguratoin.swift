//
//  AlerConfiguratoin.swift
//  Plani
//
//  Created by Raad Amar on 05.05.25.
//
import Foundation
import UIKit

extension TrackerViewController {
    
    @objc func RoutineImageTapped() {
        //  Add go to design alert
        performSegue(withIdentifier: k.segues.TrackerViewToAlertView, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let desti = segue.destination as! TrackerAlertViewController
        desti.TrackerViewDeleget = self
    }


}
