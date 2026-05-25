//
//  MangerVCE.swift
//  Plani
//
//  Created by Raad Amar on 26.04.25.
//

class MangerVCE{
    var deleget : ExercisViewController?
    
    func CheckIfSetIsEmpty(SetNum num : Int)->Bool{
        if let Exc = deleget?.SelectedExercis {
            return Exc.IsThisSetDone(SetNum: num)
        }
        return false
    }
    
    func CheckIfExersisFinished() -> Bool{
        if let Save = deleget!.SelectedExercis {
            return Save.finished
        }
        print("error")
        return false
    }
    
    func CheckifIsLocked() -> Bool{
        if let Save = deleget!.SelectedExercis {
            return Save.Locked
        }
        print("error")
        return false
    }
    
    func recalLockValue() -> Bool{
        if let x = deleget!.SelectedExercis {
            return x.Locked
        }
        print("problem in Manger")
        return false
    }

    func UpdateExercisViewController(){
        deleget?.ExercisesViewDeleget?.UpdateChanges()
    }
}
