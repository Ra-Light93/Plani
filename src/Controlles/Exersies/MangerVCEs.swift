//
//  MangerVCE.swift
//  Plani
//
//  Created by Raad Amar on 25.04.25.
//

import UIKit
import Foundation

class MangerVCEs {
    var deleget : ExercisesViewController?
    
    func shouldLoadBehalt()->Bool {
        return !(deleget!.TheDay!.IsDayAssignd())
    }
    
    
    func checkemptybauch() {
        let Defaults = UserDefaults.standard
        if  Defaults.bool(forKey: k.TraingDaysName.BauchA) &&
            Defaults.bool(forKey: k.TraingDaysName.BauchB) &&
            Defaults.bool(forKey: k.TraingDaysName.BauchC) {
                Datastructur.Functions.resetBauch()}
    }
    
    func IsRückenAssignd() -> Bool {
        return UserDefaults.standard.bool(forKey: k.TraingDaysName.Rücken)
    }

    func IsBrustAssignd() -> Bool {
        return Datastructur.Defaults.bool(forKey: k.TraingDaysName.Brust)
    }

    func IsBeisipsAssignd() -> Bool {
        return UserDefaults.standard.bool(forKey: k.TraingDaysName.Beisips)
    }

    func IsTrisipsAssignd() -> Bool {
        return UserDefaults.standard.bool(forKey: k.TraingDaysName.Trisips)
    }

   func IsSchulterAssignd() -> Bool {
        return UserDefaults.standard.bool(forKey: k.TraingDaysName.Schulter)
    }

   func IsBeineAssignd() -> Bool {
        return UserDefaults.standard.bool(forKey: k.TraingDaysName.Beine)
    }

   func IsBauchAAssignd() -> Bool {
        return UserDefaults.standard.bool(forKey: k.TraingDaysName.BauchA)
    }

    func IsBauchBAssignd() -> Bool {
        return UserDefaults.standard.bool(forKey: k.TraingDaysName.BauchB)
    }

    func IsBauchCAssignd() -> Bool {
        return UserDefaults.standard.bool(forKey: k.TraingDaysName.BauchC)
    }

    func IsRuningAssignd() -> Bool {
        return UserDefaults.standard.bool(forKey: k.TraingDaysName.Runing)
    }
    
    func IsRückenNotAssignd() -> Bool {
        return !UserDefaults.standard.bool(forKey: k.TraingDaysName.Rücken)
    }

    func IsBrustNotAssignd() -> Bool {
        return !Datastructur.Defaults.bool(forKey: k.TraingDaysName.Brust)
    }

    func IsBeisipsNotAssignd() -> Bool {
        return !UserDefaults.standard.bool(forKey: k.TraingDaysName.Beisips)
    }

    func IsTrisipsNotAssignd() -> Bool {
        return !UserDefaults.standard.bool(forKey: k.TraingDaysName.Trisips)
    }

    func IsSchulterNotAssignd() -> Bool {
        return !UserDefaults.standard.bool(forKey: k.TraingDaysName.Schulter)
    }

    func IsBeineNotAssignd() -> Bool {
        return !UserDefaults.standard.bool(forKey: k.TraingDaysName.Beine)
    }

    func IsBauchANotAssignd() -> Bool {
        return !Datastructur.Defaults.bool(forKey: k.TraingDaysName.BauchA)
    }

    func IsBauchBNotAssignd() -> Bool {
        return !UserDefaults.standard.bool(forKey: k.TraingDaysName.BauchB)
    }

    func IsBauchCNotAssignd() -> Bool {
        return !UserDefaults.standard.bool(forKey: k.TraingDaysName.BauchC)
    }

    func IsRuningNotAssignd() -> Bool {
        return !UserDefaults.standard.bool(forKey: k.TraingDaysName.Runing)
    }
    
    func IsBaseMuskel(MuskelTypeName name : String)->Bool {
        return Datastructur.DictOfMuskelType[name] == k.MuskelType.Base
    }
    
    func IsBauchMuskel(MuskelTypeName name : String)->Bool {
        return Datastructur.DictOfMuskelType[name] == k.MuskelType.Bauch
    }
    
    func IsThereExercies()->Bool{
        if let safe = self.deleget?.TheDay!{
            return safe.IsThereExercies()
        }
        print("Mistak")
        return false
    }
    
    func IsDayFinished() -> Bool{
        if let bool = deleget?.TheDay!.isFinishedTrue() {
            return bool}
        print("Fehler bei IsDayFinished")
        return false
    }
    
    
    func SetSelectedExercis(Exercis exercis : Exercise){
        kExercise.selectedExer = exercis
    }
    
    func PassSelectedExercis()->Exercise{
       return kExercise.selectedExer!
    }
    
    
}
