//
//  TableExtention.swift
//  Plani
//
//  Created by Raad Amar on 10.05.25.
//

import UIKit

extension TrackerViewController : UITableViewDelegate,UITableViewDataSource {
    
    func registertableAndCell() {
        RoutineTable.delegate = self
        RoutineTable.dataSource = self
        RoutineTable.register(UINib(nibName: k.Identifiers.RoutineCell, bundle: nil), forCellReuseIdentifier:  k.Identifiers.RoutineCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Datastructur.RoutineDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RoutineTable.dequeueReusableCell(withIdentifier: k.Identifiers.RoutineCell) as! RoutineCell
        let key = Array(Datastructur.RoutineDict.keys)[indexPath.row]
        
        let Title = Datastructur.RoutineDict[key]?.Title
        let Amount = Datastructur.RoutineDict[key]?.Amount
        let Extention = Datastructur.RoutineDict[key]?.Extention
        let ImageData = Datastructur.RoutineDict[key]?.ImageData
        
        cell.TextInhaltOfRoutine.text = "\(Title!) \(Amount!) \(Extention!) :"
        cell.RoutineImage.image = nil
        
        cell.InformTracker = self
        cell.KeyInDict = Title
        
        if let value = Datastructur.RoutineDict[key]?.AmountInt() {
            cell.ArrayOfNumbers = Array(0...(value*2))
            cell.RoutinePicker.reloadAllComponents()
        }
                
        if let value = Datastructur.RoutineDict[key]?.TodayAmountTaken {
            cell.RoutinePicker.selectRow(value, inComponent: 0, animated: false)
        }
  
        if let value = Datastructur.RoutineDict[key]?.Finished {
            if value {cell.RoutineDoneIMage.image = UIImage.routineCheckW}
            else {cell.RoutineDoneIMage.image = UIImage.routineUnCheck}}
        
        cell.frame = CGRect(x: cell.frame.origin.x,
                            y: cell.frame.origin.y,
                            width: RoutineTable.frame.width,
                            height: cell.frame.height)
        
        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

}

// MARK: - Swip Extention

extension TrackerViewController {
    //  Trailing swipe (rechts -> links): DELETE
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completion) in
            let key = Array(Datastructur.RoutineDict.keys)[indexPath.row]
            let Alert = UIAlertController(title: "Deleting \(key) ", message: nil, preferredStyle: .alert)
            
            let Action = UIAlertAction(title: "Delete", style: .default) { action in
                Datastructur.RoutineDict.removeValue(forKey: key)
                Datastructur.Functions.SaveRoutine()
                self.RoutineTable.reloadData()}
            Action.setValue(UIColor.red, forKey: "titleTextColor")
            
            let Cancle = UIAlertAction(title: "Cancel", style: .cancel)
            Cancle.setValue(UIColor.label, forKey: "titleTextColor")
            
            Alert.addAction(Action)
            Alert.addAction(Cancle)
  
            self.present(Alert, animated: true)
            completion(true)
        }
        deleteAction.backgroundColor = .systemRed
        deleteAction.image = UIImage(systemName: "trash")

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
        
    }

  
}

