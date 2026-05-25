//
//  UiEnhancer.swift
//  Plani
//
//  Created by Raad Amar on 01.05.25.
//

protocol UpdateFromExerSetting {
    func UpdateChanges()
}
extension ExercisesViewController : UpdateFromExerSetting {
    func UpdateChanges() {
        ExercisesTable.reloadData()
        self.TheDay?.UpdateDayFinished()
        self.LoadAnimation()
    }

}
