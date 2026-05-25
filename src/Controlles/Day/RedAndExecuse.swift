//
//  RedemtionAndExecuse.swift
//  Plani
//
//  Created by Raad Amar on 02.05.25.
//

import UIKit

extension DayViewController {
    
    func RedAndExecuse(Row row : Int) {
        let alert = UIAlertController(title: "Why?", message: "People’s lives don’t end when they die; they end when they lose faith", preferredStyle: .alert)
        
        let ActionCancel = UIAlertAction(title: "cancel", style: .cancel)
        ActionCancel.setValue(Manger.contrastingColor(), forKey: "titleTextColor")
        alert.addAction(ActionCancel)
        let ActionRedemption = UIAlertAction(title: "Redemption?", style: .default) { action in
            self.DayesArray[row].RedemptionOn();
            self.DayesTableView.reloadData()
        }
        ActionRedemption.setValue(UIColor.systemRed, forKey: "titleTextColor")
        alert.addAction(ActionRedemption)
        
        let ActionExcuse = UIAlertAction(title: "Exam?", style: .default) { action in
            self.DayesArray[row].ExcuseOn();
            self.DayesTableView.reloadData()
        }
        alert.addAction(ActionExcuse)
        ActionExcuse.setValue(UIColor.systemRed, forKey: "titleTextColor")
            
        present(alert, animated: true)
    }
    
    func RedoExercuseAndRed(Row row : Int) {
        let alert = UIAlertController(title: "Remove?", message: nil, preferredStyle: .alert)
        let cancle = UIAlertAction(title: "cancel", style: .cancel)
        cancle.setValue(Manger.contrastingColor(), forKey: "titleTextColor")
        alert.addAction(cancle)
        
        if DayesArray[row].isRedemtionTrue() {
            let ActionremoveRedemption = UIAlertAction(title: "Redemption?", style: .default) { action in
                self.DayesArray[row].RedemptionOff();
                self.DayesTableView.reloadData()
            }
            ActionremoveRedemption.setValue(UIColor.systemRed, forKey: "titleTextColor")
            alert.addAction(ActionremoveRedemption)
        }
       
        if DayesArray[row].isExuseTrue() {
            let ActionRemvoeExcuse = UIAlertAction(title: "Exam?", style: .default) { action in
                self.DayesArray[row].ExcuseOff();
                self.DayesTableView.reloadData()
            }
            ActionRemvoeExcuse.setValue(UIColor.systemRed, forKey: "titleTextColor")
            alert.addAction(ActionRemvoeExcuse)
          
        }
        
        let titleAttr = NSAttributedString(
          string: alert.title!,
          attributes: [
            .foregroundColor: Manger.contrastingColor(),
            .font: UIFont.boldSystemFont(ofSize: 19)
          ]
        )
        alert.setValue(titleAttr, forKey: "attributedTitle")
        
        present(alert, animated: true)
    }
    
    func NotYourDay() {
        let alert = UIAlertController(title: "Future Is Unwritten", message: "You can only control the present — neither the past nor the future.", preferredStyle: .alert)
        let CancelAction = UIAlertAction(title: "cancel", style: .cancel)
        CancelAction.setValue(UIColor.systemRed, forKey: "titleTextColor")
        alert.addAction(CancelAction)
        present(alert, animated: true)
    }
    
    

}
