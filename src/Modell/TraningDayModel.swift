//
//  TraningDay.swift
//  Plani
//
//  Created by Raad Amar on 03.04.25.
//
import UIKit

class Traning_Day : Codable{
     var name : String
     var logo  : String? = nil
     var finished : Bool = false
     var Exercises : [Exercise] = []
     var Assigndnumber : Int = 0
     var BaseMukel : String?
     var BauchMuskel : String?
     var AssigndLogo : Bool = false
     var Loser : Bool = false
     var Execuse : Bool = false
     var Redemption : Bool = false


    init (name : String){
        self.name = name
    }

    func haslogo ()-> Bool{
        return self.logo != nil}
    
    func hasNologo ()-> Bool{
        return self.logo == nil}
    
    func isFinishedTrue()->Bool{
        return self.finished}
    
    func isFinishedFalse()->Bool{
        return !self.finished }
    
    func isAssigndLogoTrue()->Bool {
        return self.AssigndLogo}
    
    func isAssigndLogoFalse()->Bool {
        return !self.AssigndLogo}
    
    func isLoser()->Bool {
        return self.Loser && !self.Execuse && !self.Redemption}

    func isBaseMuskelTrue()-> Bool {
        return !(self.BaseMukel == nil)}
    
    func isBaseMuskelFalse()-> Bool {
        return self.BaseMukel == nil}
    
    func isBauchMuskelTrue()-> Bool {
        return !(self.BauchMuskel==nil)}
    
    func isBauchMuskelFalse()-> Bool {
        return (self.BauchMuskel==nil)}
    
    func removeTheseElement(AimdMuskel RemoveName : String){
        self.ResetThese(AimdMuskel: RemoveName)
        self.Exercises.removeAll { $0.AmidMuskel == RemoveName }
    }
    
    func IsDayAssignd()->Bool{
        return self.isBaseMuskelTrue() || self.isBauchMuskelTrue()
    }
    
    func AddThisElement(ElmentToAdd elm: [Exercise]){
        self.Exercises.append(contentsOf: elm)
    }
    
    func IsLoser(){
        if isFinishedFalse() && !self.Execuse && !self.Redemption {
            self.Loser = true
            self.AssigndLogo = true
            ResetDay()
            ResetAllExercises()
            Exercises = []
        }
    }
    
    func displayInfo() {
        print("Name: \(name)")
        print("Logo: \(logo ?? "No Logo")")
        print("Finished: \(finished)")
        print("Exercises count: \(Exercises.count)")
        print("Assigned Number: \(Assigndnumber)")
        print("Base Muskel: \(BaseMukel ?? "nil")")
        print("Bauch Muskel: \(BauchMuskel ?? "nil")")
        print("Assigned Logo: \(AssigndLogo)")
        print("Loser: \(Loser)\n")
    }
    
    func getNameofBase()->String?{
        return self.BaseMukel
    }
    
    func getNameofBauch()->String? {
        return self.BauchMuskel
    }
    
    func setNameofBauch(Name name:String){
        self.BauchMuskel = name
    }
    
    func setNameofBase(Name name:String){
        self.BaseMukel = name
    }
    
    func IsThereExercies()->Bool{
        return !(self.Exercises.isEmpty)
    }
    
    func isRedemtionTrue()->Bool{
        return Redemption
    }
    
    func isExuseTrue()->Bool{
        return Execuse
    }
    
    func IsAllAssigndMuskelfinished()->Bool{
        for elm in Exercises {
            if !elm.finished {return false}
        }
        return true
    }
    
    func UpdateDayFinished(){
        if isBaseMuskelTrue() &&
           isBauchMuskelTrue() &&
           IsAllAssigndMuskelfinished() {
            self.finished = true
        }
        else {
            self.finished = false
        }
    }
    
    private func ResetThese(AimdMuskel RemoveName : String) {
        for elm in Exercises {
            if elm.AmidMuskel == RemoveName {elm.Reset()}
        }
        if isBaseMuskelTrue() {if BaseMukel == RemoveName {BaseMukel = nil}}
        if isBauchMuskelTrue() {if BauchMuskel == RemoveName {BauchMuskel = nil}}
    }
    
    private func ResetAllExercises(){
        for elm in Exercises {
            elm.Reset()
            Datastructur.Defaults.set(false, forKey: elm.AmidMuskel)
        }
    }
    
    private func ResetDay(){
        if isBaseMuskelTrue()  {
            Datastructur.Defaults.set(false, forKey: BaseMukel!);
            BaseMukel = nil }
        if isBauchMuskelTrue() {
            Datastructur.Defaults.set(false, forKey: BauchMuskel!);
            BauchMuskel = nil}
    }
    
    
    func RedemptionOn(){
        Redemption = true
        logo = k.ExraImages.Redemption
    }
    
    func isThereExecusOrRed() -> Bool{
        return  Redemption || Execuse
    }

    func ShouldOpen()->Bool{
        if isThereExecusOrRed()  {return false}
        return !Loser
    }
    
    func IsLoserAndNoRedAndExcuse()->Bool {
        return Loser && !isThereExecusOrRed()
    }
    
    func ExcuseOn(){
        Execuse = true
        logo = k.ExraImages.Exam
    }
    
    func ExcuseOff(){
        Execuse = false
        logo = nil
    }
    
    func RedemptionOff(){
        Redemption = false
        logo = nil
    }
}
