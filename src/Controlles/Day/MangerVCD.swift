//
//  MangerVCD.swift
//  Plani
//
//  Created by Raad Amar on 25.04.25.
//

import Foundation
import UIKit

protocol MangerVCDdelegt{
    
}

class MangerVCD {
    var deleget : DayViewController?
    
    // Loading Data from prisitent Storage
    func loadData() {
        Datastructur.Functions.loadData()
        if let safearray = Datastructur.sharedData?.Dayes {
            deleget!.DayesArray = safearray
        }
        else {print("array is not found :(")}
    }

    
    // tanslucentConfiguration
    private func MakeNavigationbarTranckucent() {
         deleget?.NavigationBar.setBackgroundImage(UIImage(), for: .default)
         deleget?.NavigationBar.shadowImage = UIImage()
         deleget?.NavigationBar.isTranslucent = true
         deleget?.NavigationBar.backgroundColor = .clear
    }
    
    private func MakeTableTranckucent() {
         deleget?.DayesTableView.backgroundColor = .clear
         deleget?.DayesTableView.separatorStyle = .none
    }
    
    func MakeElementTranclusent(){
        self.MakeNavigationbarTranckucent()
        self.MakeTableTranckucent()
    }

    func synchronizeTheDate(){
        Datastructur.Functions.synchronizeTime()
    }
    
    func UnTrainedDayes() {
        Datastructur.Functions.ReflectTheTimeOnTraining()
    }
    func RestAllData(){
        Datastructur.Functions.DeleteAndResetAll()
        loadData()
    }
    
    func RestNotification() {
        Datastructur.Defaults.set(false, forKey: k.Defaults.FirstLaunchNotification)
    }
    
    func IsTody(Row row : Int)->Bool {
        let Today = Datastructur.Functions.DayDate()
        return Today == deleget!.DayesArray[row].name
    }
    
    func contrastingColor() -> UIColor {
        // Versuchen, Grauwert zu ermitteln
        var white: CGFloat = 0
        if UIColor.systemBackground.getWhite(&white, alpha: nil) {
            // wenn heller als 0.5 → Text in Schwarz, sonst in Weiß
            return (white > 0.5) ? .black : .white
        }
        // Fallback
        return .black
    }
    
    
    func Shouldinit(){
        if !UserDefaults.standard.bool(forKey: k.Defaults.FirstLaunch)
        {Datastructur.Functions.initAll( DataFilePath: k.DataFilePath!)}
        
        if !UserDefaults.standard.bool(forKey: k.Defaults.FirstLaunchNotification)
        {Datastructur.Functions.initNotification(DataFilePath: k.DataFilePathNotification!)}
        else {Datastructur.showMeAllnotification()}
    }
}



//Datastructur.Functions.saveAction =
////give save and load func an datastruct
//Datastructur.Functions.saveAction = self.SaveData

