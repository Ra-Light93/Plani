//
//  DelgetFromCellRoutine.swift
//  Plani
//
//  Created by Raad Amar on 11.05.25.
//

extension TrackerViewController : InformTrackerViewFromCellPicker {
    func UpdatePickerIsSelected(NewValue new: Int, SelectedRowName Name: String) {
        Datastructur.RoutineDict[Name]?.TodayAmountTaken = new
        RoutineTable.reloadData()
    }
    

    
    
    //InformExercis!.PickerSelected(NewValue: row, SelectedRow: indexPath!)
}
