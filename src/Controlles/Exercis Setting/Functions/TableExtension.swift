//
//  TableExtension.swift
//  Plani
//
//  Created by Raad Amar on 27.04.25.
//

import UIKit

extension ExercisViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SelectedExercis!.repates
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ExercisTableView.dequeueReusableCell(withIdentifier: k.Identifiers.ExercisSettingCell) as! ExercisSettingCell
       
        // Set the correct amount
        cell.SetXName.text = "Set \(indexPath.row + 1)"
        // Set the picker to privious Value
        if let value = SelectedExercis?.AmountOfcompletedReps[indexPath.row] {
            cell.Picker.selectRow( value , inComponent: 0, animated: false)
        }
        // Set Aim
        cell.AimToX.text = "Aim for \(SelectedExercis!.amount)"
        // Set the correct pic
        if Manger.CheckIfSetIsEmpty(SetNum: indexPath.row) {
            cell.ExercisIMageFinish.image = UIImage.doneExercis}
        else { cell.ExercisIMageFinish.image = UIImage.unfinishedExercis}
        // Set indexPath in Cell
        cell.indexPath = indexPath.row
        // Set delegt in Cell
        cell.InformExercis = self
        // Set Picker
        cell.Picker.isUserInteractionEnabled = !Manger.recalLockValue()
        // Update Lockimage
        ConifugureandUpdateLock()
        // Update Cell wdith
        cell.frame = CGRect(
            x: cell.frame.origin.x,
            y: cell.frame.origin.y,
            width: ExercisTableView.frame.width,
            height: cell.frame.height
        )
        return cell
    }
    
    func registertableAndCell(){
        self.ExercisTableView.delegate = self
        self.ExercisTableView.dataSource = self
        self.ExercisTableView.register(UINib(nibName: k.Identifiers.ExercisSettingCell, bundle:nil ), forCellReuseIdentifier: k.Identifiers.ExercisSettingCell)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    

    
}
