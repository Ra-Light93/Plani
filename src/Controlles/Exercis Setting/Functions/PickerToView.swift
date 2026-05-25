//
//  PickerToView.swift
//  Plani
//
//  Created by Raad Amar on 30.04.25.
//

extension ExercisViewController : ImformExercisVC {
    func PickerSelected(NewValue new: Int, SelectedRow Row : Int ) {
        SelectedExercis?.setValueOfRips(SetNum: Row, Value: new)
        self.ExercisTableView.reloadData()
        ConifugureandUpdateLock()
        ExercisesViewDeleget?.UpdateChanges()
    }

}
