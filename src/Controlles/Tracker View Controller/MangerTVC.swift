//
//  Manger.swift
//  Plani
//
//  Created by Raad Amar on 13.05.25.
//

struct Manger{
    static let DictForRoutinesSet = "DictForRoutinesSet"

    static func UpdateTodayForRoutine(){
        Datastructur.Defaults.set(Datastructur.Functions.DayDate(), forKey: DictForRoutinesSet)
    }
    
    static func ResetAllRoutineForToday(){
        for elem in Datastructur.RoutineDict.values {
            elem.Finished = false
            elem.TodayAmountTaken = 0
        }
    }
    
    static func  resetRoutinesForTodayIfSyncedy(){
        if Datastructur.Defaults.string(forKey: DictForRoutinesSet) != Datastructur.Functions.DayDate() {
            UpdateTodayForRoutine()
            ResetAllRoutineForToday()
        }
    }
    
    
}
