//
//  Constents.swift
//  Plani
//
//  Created by Raad Amar on 03.04.25.
//

import CoreData

struct k {
    
    struct MuskelType {
        static let Base = "Base"
        static let Bauch = "Bauch"
    }
    
    struct ExraImages{
        static let Redemption = "Redemption"
        static let kirito1 = "kirito1"
        static let Loser = "Loser"
        static let Exam = "Exam"
        static let Krank = "Krank"
        static let MuskelKarte = "MuskelKarte"
        static let DoneExercis = "DoneExercis"
        static let UnfinishedExercis = "UnfinishedExercis"
        static let Locked = "Locked"
        static let Unlocked = "Unlocked"
        static let DayDone1 = "DayDone1"
        static let DayDone2 = "DayDone2"
        static let FotoOfNewItem = "FotoOfNewItem"
    }
    static let Notification = "Notification"

    static let dictOfSelectedDayes = "dictOfSelectedDayes"

    static let MyList = "Mylist"
    static let MyListNoti = "MyListNoti"
    static let MyListRoutine = "MyListRoutine"
    
    static let LastOpenMontag = "LastOpenMontag"

    
    static let DataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(k.MyList)
    
    static let DataFilePathNotification = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(k.MyListNoti)
    
    static let DataFilePathRoutine = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(k.MyListRoutine)
    
    struct Tage {
        static let Montag = "Montag"
        static let Diesstag = "Dienstag"
        static let Mittwoch = "Mittwoch"
        static let Donnerstag = "Donnerstag"
        static let Freitag = "Freitag"
        static let Samstag = "Samstag"
        static let Sonntag = "Sonntag"
        static let Dayes = "Dayes"
    }


    static let DictDayToDisplayName: [String: String] = [
        k.Tage.Montag     : "Monday",
        k.Tage.Diesstag   : "Tuesday",
        k.Tage.Mittwoch   : "Wednesday",
        k.Tage.Donnerstag : "Thursday",
        k.Tage.Freitag    : "Friday",
        k.Tage.Samstag    : "Saturday",
        k.Tage.Sonntag    : "Sunday"
    ]
        
  
/*
    struct TraingDaysName {
        static let Rücken = "Rücken"
        static let Brust = "Brust"
        static let Beisips = "Beisips"
        static let Trisips = "Trisips"
        static let Schulter = "Schulter"
        static let Beine = "Beine"
        static let BauchA = "BauchA"
        static let BauchB = "BauchB"
        static let BauchC = "BauchC"
        static let Runing = "Runing"
    }
*/
    struct TraingDaysName {
        static let Rücken   = "Back"
        static let Brust    = "Chest"
        static let Beisips  = "Biceps"
        static let Trisips  = "Triceps"
        static let Schulter = "Shoulders"
        static let Beine    = "Legs"
        static let BauchA   = "Ab Circuit A"
        static let BauchB   = "Ab Circuit B"
        static let BauchC   = "Ab Circuit C"
        static let Runing   = "Running"
    }
    
    struct ReturnStringsOfAlert {
        static let ImageFailed = "ImageFailed"
        static let TextFailed = "TextFailed"
        static let AmountFailed = "AmountFailed"
        static let ExtentionFailed = "ExtentionFailed"
        static let Done = "Done"
    }
    
    
    struct Identifiers {
        static let DayesCell = "DayesCell"
        static let ExerciseCell = "ExerciseCell"
        static let ExercisSettingCell = "ExercisSettingCell"
        static let RoutineCell = "RoutineCell"
    }
    
    struct Nibs {
        static let DayesCell = "DayCellModels"
        static let ExerciseCell = "ExerciseCell"
    }
    
    struct Defaults {
        static let FirstLaunch = "FirstLaunch"
        static let FirstLaunchNotification = "FirstLaunchNotification"
    }
    
    struct DayesTable {
        static let sort = "sort"
    }
    
    struct segues {
        static let FromDaysTOExercises = "FromDaysTOExercises"
        static let DisplayExercisActivity = "DisplayExercisActivity"
        static let GoToMain = "GoToMain"
        static let MainToTracker = "MainToTracker"
        static let TrackerViewToAlertView = "TrackerViewToAlertView"
    }
    
    struct Gifs{
        static let Bahelt = "Bahelt"
        static let CancelGuy = "CancelGuy"
        static let Atome1 = "Atome1"
        static let Atome2 = "Atome2"
        static let SearchingGuy = "SearchingGuy"
    }
    
    struct Muskel {
        static let IMBauch = "IMBauch"
        static let IMBeine = "IMBeine"
        static let IMBiceps = "IMBiceps"
        static let IMBrust = "IMBrust"
        static let IMRückenback = "IMRückenback"
        static let IMRuning = "IMRuning"
        static let IMTriceps = "IMTriceps"
        static let IMBack = "IMBack"
    }

    
    struct Exercise {
        static let WideChest  = "Wide Chest"
        static let DiminishedChest  = "Diminished Chest"
        static let WithDMwideChest  = "With DM Wide Chest"
        static let WithDMNarrowChest = "With DM Narrow Chest"
        static let Normal = "Normal"
        
        static let Blank = "Blank"
        static let Fluterkick = "Fluter kick"
        static let KneeChrunch = "Knee Chrunch"
        static let LegRise = "Leg Rise"
        static let MountinClim = "Mountin Clim"
        static let ReversChrunch = "Revers Chrunch"
        static let Setup1 = "Set-up1"
        static let Setup2 = "Set-up2"
        static let SideCrunch = "Side Crunch"
        static let SwitchTwest = "Switch Twest"
        
        static let Überschenkel1 = "Überschenkel 1"
        static let Überschenkel2 = "Überschenkel 2"
        static let Beinbeuger = "Beinbeuger"
        
        static let Beisips1 = "Beisips 1"
        static let Beisips2 = "Beisips 2"
        static let Beisips3 = "Beisips 3"
        
        static let WideRücken = "Wide Rücken"
        static let NarrowRücken = "Narrow Rücken"
        
        static let Sideschulter = "Sideschulter"
        static let SideBackschulter = "Side Backschulter"
        
        static let OverHeadTricep = "OverHead Tricep"
        static let Hammer = "Hammer"
        static let SleepedTricep = "Sleeped Tricep"
        
        static let Runing = "Runing"
    }
    


}
