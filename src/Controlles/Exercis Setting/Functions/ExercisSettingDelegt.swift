//
//  ExercisSettingDelegt.swift
//  Plani
//
//  Created by Raad Amar on 27.04.25.
//

protocol ExercisSettingDelegt  {
    func SetSelectedExercis(Exercis exrcis : Exercise )
    
}

extension ExercisViewController : ExercisSettingDelegt {
    func SetSelectedExercis(Exercis exrcis: Exercise) {
        print("select is set")
        self.SelectedExercis = exrcis
    }

}

