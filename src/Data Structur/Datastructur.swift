//
//  Datastructur.swift
//  Plani
//
//  Created by Raad Amar on 03.04.25.
//

import UIKit
import CoreData
import WebKit

struct Datastructur{
    
    static let videoMapping: [Int: String] = [
        1: "Video1",   2: "Video2",   3: "Video3",
        4: "Video4",   5: "Video5",   6: "Video6",
        7: "Video7",   8: "Video8",   9: "Video9",
        10: "Video10", 11: "Video5", 12: "Video1",

        13: "Video2",  14: "Video3",  15: "Video4",
        16: "Video5",  17: "Video6",  18: "Video7",
        19: "Video8",  20: "Video9",  21: "Video10",
        22: "Video6", 23: "Video1",  24: "Video2",

        25: "Video3",  26: "Video4",  27: "Video5",
        28: "Video6",  29: "Video7",  30: "Video8",
        31: "Video9",  32: "Video10"
    ]
    
    //Dict of Muskel Typ
    static let DictOfMuskelType = [
        k.TraingDaysName.BauchA : k.MuskelType.Bauch,
        k.TraingDaysName.BauchB : k.MuskelType.Bauch,
        k.TraingDaysName.BauchC : k.MuskelType.Bauch,
        k.TraingDaysName.Beine  : k.MuskelType.Base,
        k.TraingDaysName.Beisips  : k.MuskelType.Base,
        k.TraingDaysName.Brust  : k.MuskelType.Base,
        k.TraingDaysName.Runing  : k.MuskelType.Base,
        k.TraingDaysName.Rücken  : k.MuskelType.Base,
        k.TraingDaysName.Schulter  : k.MuskelType.Base,
        k.TraingDaysName.Trisips  : k.MuskelType.Base,
    ]
    
    // UserDefaults
    static let Defaults = UserDefaults.standard
    
    // The saved struct which holds needed Arrays
    static var sharedData: ArraysDataBundle?
    static var NotificationsArray:[NotificationItem]?
    static var RoutineDict:[String : RoutineItem] = [:]
    
    // Struct the holds Array To be Stored
    struct ArraysDataBundle: Codable {
        let Rücken: [Exercise]
        let Brust: [Exercise]
        let Beisips: [Exercise]
        let Trisips: [Exercise]
        let Schulter: [Exercise]
        let Beine: [Exercise]
        let BauchA: [Exercise]
        let BauchB: [Exercise]
        let BauchC: [Exercise]
        let Runing: [Exercise]
        let Dayes: [Traning_Day]
    }
    
    static let DictDayToNum: [String: Int] = [
        k.Tage.Montag: 0,
        k.Tage.Diesstag: 1,
        k.Tage.Mittwoch: 2,
        k.Tage.Donnerstag: 3,
        k.Tage.Freitag: 4,
        k.Tage.Samstag: 5,
        k.Tage.Sonntag: 6
    ]
    
    static let DictNumToDay: [Int: String] = [
        0 : k.Tage.Montag,
        1 : k.Tage.Diesstag,
        2 : k.Tage.Mittwoch,
        3 : k.Tage.Donnerstag,
        4 : k.Tage.Freitag,
        5 : k.Tage.Samstag,
        6 : k.Tage.Sonntag
    ]
    
    struct Functions {
        static func initNotification(DataFilePath : URL) {
            NotificationsArray =  initNotificationFromJason()
            let encoder =  PropertyListEncoder()
            do {
                let Data = try encoder.encode(NotificationsArray)
                try Data.write(to: DataFilePath)
            } catch {
                print(error.localizedDescription)
                return
            }
            UserDefaults.standard.set(true, forKey: k.Defaults.FirstLaunchNotification)
        }
        
        static func initAll(DataFilePath : URL){
            // Training days
            let Montag = Traning_Day(name: k.Tage.Montag)
            let Dienstag = Traning_Day(name: k.Tage.Diesstag)
            let Mittwoch = Traning_Day(name: k.Tage.Mittwoch)
            let Donnerstag = Traning_Day(name: k.Tage.Donnerstag)
            let Freitag = Traning_Day(name: k.Tage.Freitag)
            let Samstag = Traning_Day(name: k.Tage.Samstag)
            let Sonntag = Traning_Day(name: k.Tage.Sonntag)
            
            // Bauch collection A
            let SitUp = Exercise(name: k.Exercise.Setup1, repates: 3, amount: 20, order: 100, AmidMuskel: k.TraingDaysName.BauchA)
            let ReverseCrunch = Exercise(name: k.Exercise.ReversChrunch, repates: 3, amount: 15, order: 101, AmidMuskel: k.TraingDaysName.BauchA)
            let SwitchTwest = Exercise(name: k.Exercise.SwitchTwest, repates: 3, amount: 40, order: 102, AmidMuskel: k.TraingDaysName.BauchA)
            let Blank1 = Exercise(name: k.Exercise.Blank, repates: 3, amount: 60, order: 104, AmidMuskel: k.TraingDaysName.BauchA)
            
            // Bauch collection B
            let SitUp2 = Exercise(name: k.Exercise.Setup2, repates: 3, amount: 25, order: 100, AmidMuskel: k.TraingDaysName.BauchB)
            let KneeCrunches = Exercise(name: k.Exercise.KneeChrunch, repates: 3, amount: 15, order: 101, AmidMuskel: k.TraingDaysName.BauchB)
            let FluterKicks = Exercise(name: k.Exercise.Fluterkick, repates: 3, amount: 20, order: 102, AmidMuskel: k.TraingDaysName.BauchB)
            let Blank2 = Exercise(name: k.Exercise.Blank, repates: 3, amount: 60, order: 104, AmidMuskel: k.TraingDaysName.BauchB)
            
            // Bauch collection C
            let LegRaise = Exercise(name: k.Exercise.LegRise, repates: 3, amount: 25, order: 100, AmidMuskel: k.TraingDaysName.BauchC)
            let Mountainclim = Exercise(name: k.Exercise.MountinClim, repates: 3, amount: 25, order: 101, AmidMuskel: k.TraingDaysName.BauchC)
            let SideCrunches = Exercise(name: k.Exercise.SideCrunch, repates: 3, amount: 40, order: 103, AmidMuskel: k.TraingDaysName.BauchC)
            let Blank3 = Exercise(name: k.Exercise.Blank, repates: 3, amount: 60, order: 104, AmidMuskel: k.TraingDaysName.BauchC)
            
            // Beine collection
            let Üschenkel1 = Exercise(name: k.Exercise.Überschenkel1, repates: 3, amount: 12, order: 1, AmidMuskel: k.TraingDaysName.Beine)
            let Üschenkel2 = Exercise(name: k.Exercise.Überschenkel2, repates: 3, amount: 12, order: 2, AmidMuskel: k.TraingDaysName.Beine)
            let BeinBeuger = Exercise(name: k.Exercise.Beinbeuger, repates: 3, amount: 30, order: 3, AmidMuskel: k.TraingDaysName.Beine)
            
            // Beisips collection
            let Beisips1 = Exercise(name: k.Exercise.Beisips1, repates: 3, amount: 15, order: 1, AmidMuskel: k.TraingDaysName.Beisips)
            let Beisips2 = Exercise(name: k.Exercise.Beisips2, repates: 3, amount: 15, order: 2, AmidMuskel: k.TraingDaysName.Beisips)
            let Beisips3 = Exercise(name: k.Exercise.Beisips3, repates: 3, amount: 10, order: 3, AmidMuskel: k.TraingDaysName.Beisips)
            
            // Tricips collection
            let OverHeadTricep = Exercise(name: k.Exercise.OverHeadTricep, repates: 3, amount: 15, order: 1, AmidMuskel: k.TraingDaysName.Trisips)
            let Hammer = Exercise(name: k.Exercise.Hammer, repates: 3, amount: 12, order: 2, AmidMuskel: k.TraingDaysName.Trisips)
            let SleepTricps = Exercise(name: k.Exercise.SleepedTricep, repates: 3, amount: 12, order: 3, AmidMuskel: k.TraingDaysName.Trisips)
            
            // Chest collection
            let Normal = Exercise(name: k.Exercise.Normal, repates: 3, amount: 10, order: 1, AmidMuskel: k.TraingDaysName.Brust)
            let WideWithDMChest = Exercise(name: k.Exercise.WithDMwideChest, repates: 3, amount: 10, order: 2, AmidMuskel: k.TraingDaysName.Brust)
            let NarrowWithDMChest = Exercise(name: k.Exercise.WithDMNarrowChest, repates: 3, amount: 10, order: 3, AmidMuskel: k.TraingDaysName.Brust)
            let WideChest = Exercise(name: k.Exercise.WideChest, repates: 3, amount: 10, order: 4, AmidMuskel: k.TraingDaysName.Brust)
            let DimondChest = Exercise(name: k.Exercise.DiminishedChest, repates: 3, amount: 10, order: 5, AmidMuskel: k.TraingDaysName.Brust)
            
            // Rücken collection
            let NarrowRücken = Exercise(name: k.Exercise.NarrowRücken, repates: 1, amount: 50, order: 1, AmidMuskel: k.TraingDaysName.Rücken)
            let WideRücken = Exercise(name: k.Exercise.WideRücken, repates: 1, amount: 50, order: 2, AmidMuskel: k.TraingDaysName.Rücken)
            
            // Schulter collection
            let shulter1 = Exercise(name: k.Exercise.Sideschulter, repates: 3, amount: 15, order: 1, AmidMuskel: k.TraingDaysName.Schulter)
            let shulter2 = Exercise(name: k.Exercise.SideBackschulter, repates: 3, amount: 10, order: 2, AmidMuskel: k.TraingDaysName.Schulter)
            
            // Run collection
            let Runing = Exercise(name: k.Exercise.Runing, repates: 1, amount: 20, order: 1, AmidMuskel: k.TraingDaysName.Runing)
            Runing.logo = k.Muskel.IMRuning
            
            // Grouping
            let Rücken: [Exercise] = [NarrowRücken, WideRücken]
            let Brust: [Exercise] = [Normal, WideWithDMChest, NarrowWithDMChest, WideChest, DimondChest]
            let Beisips: [Exercise] = [Beisips1, Beisips2, Beisips3]
            let Trisips: [Exercise] = [OverHeadTricep, Hammer, SleepTricps]
            let Schulter: [Exercise] = [shulter1, shulter2]
            let Beine: [Exercise] = [Üschenkel1, Üschenkel2, BeinBeuger]
            let BauchA: [Exercise] = [SitUp, ReverseCrunch, SwitchTwest, Blank1]
            let BauchB: [Exercise] = [SitUp2, KneeCrunches, FluterKicks, Blank2]
            let BauchC: [Exercise] = [LegRaise, Mountainclim, SideCrunches, Blank3]
            let Run:[Exercise] = [Runing]
            let Dayes: [Traning_Day] = [Montag, Dienstag, Mittwoch, Donnerstag, Freitag, Samstag, Sonntag]
            // let NotificationArray = initNotification()
            
            let TraingDayBoolMap: [String: Bool] = [  //crash ? here ist das problem
                k.TraingDaysName.Rücken: false,
                k.TraingDaysName.Brust: false,
                k.TraingDaysName.Beisips: false,
                k.TraingDaysName.Trisips: false,
                k.TraingDaysName.Schulter: false,
                k.TraingDaysName.Beine: false,
                k.TraingDaysName.BauchA: false,
                k.TraingDaysName.BauchB: false,
                k.TraingDaysName.BauchC: false
            ]
            
            
            UserDefaults.standard.set(TraingDayBoolMap, forKey: k.dictOfSelectedDayes)
            
            
            let all = ArraysDataBundle.init(Rücken: Rücken, Brust: Brust, Beisips: Beisips, Trisips: Trisips, Schulter: Schulter, Beine: Beine, BauchA: BauchA, BauchB: BauchB, BauchC: BauchC,Runing: Run, Dayes: Dayes)
            
            let encoder =  PropertyListEncoder()
            do {
                let Data = try encoder.encode(all)
                try Data.write(to: DataFilePath)
            } catch {
                print(error.localizedDescription)
                return
            }
            
            UserDefaults.standard.set(true, forKey: k.Defaults.FirstLaunch)
        }
        
        static func resetFirstLaunch(defaults: UserDefaults, value: Bool) {
            defaults.set(value, forKey: k.Defaults.FirstLaunch)
        }
        
        
        
        static func DeleteAndResetAll(){
            // reset Arrayes
            sharedData = ArraysDataBundle(
                Rücken: [],
                Brust: [],
                Beisips: [],
                Trisips: [],
                Schulter: [],
                Beine: [],
                BauchA: [],
                BauchB: [],
                BauchC: [],
                Runing: [],
                Dayes: []
            )
            
            ResetDefaults()
            Defaults.set(false, forKey: k.Defaults.FirstLaunch)
            SaveData()
            initAll(DataFilePath: k.DataFilePath!)

        }
        
        
        static func ResetDefaults(){
            let BoolNotiFirestLaunch = Defaults.bool(forKey: k.Defaults.FirstLaunchNotification)
            if let appDomain = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: appDomain)
            }
            Defaults.set(BoolNotiFirestLaunch, forKey: k.Defaults.FirstLaunchNotification)
        }
        
        static func resetWeek() {
            Defaults.set(false, forKey: k.Tage.Montag)
            Defaults.set(false, forKey: k.Tage.Diesstag)
            Defaults.set(false, forKey: k.Tage.Mittwoch)
            Defaults.set(false, forKey: k.Tage.Donnerstag)
            Defaults.set(false, forKey: k.Tage.Freitag)
            Defaults.set(false, forKey: k.Tage.Samstag)
            Defaults.set(false, forKey: k.Tage.Sonntag)
        }
        
        
        static func resetBauch() {
            let Def = UserDefaults.standard
            Def.set(false, forKey: k.TraingDaysName.BauchA)
            Def.set(false, forKey: k.TraingDaysName.BauchB)
            Def.set(false, forKey: k.TraingDaysName.BauchC)
        }
        
        
//MARK: - saving data functions
        static func SaveData() {
            SaveSharedData()
            SaveNotifcation()
            SaveRoutine()
        }
        
        static func SaveSharedData() {
            if let all = Datastructur.sharedData {
                let encoder =  PropertyListEncoder()
                do {
                    let Data = try encoder.encode(all)
                    try Data.write(to: k.DataFilePath!)
                } catch {
                    print(error.localizedDescription)
                }
            }
            else {print("Nothing to Save :(")}
        }
        
        static func SaveNotifcation() {
            if let dataNoti = Datastructur.NotificationsArray {
                let encoder = PropertyListEncoder()
                do {
                    let Data = try encoder.encode(dataNoti)
                    try Data.write(to: k.DataFilePathNotification!)
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            else {print("Nothing to Save :(")}
        }
        
        static func SaveRoutine() {
            let encoder = PropertyListEncoder()
            do {
                let Data = try encoder.encode(RoutineDict)
                try Data.write(to: k.DataFilePathRoutine!)
            }
            catch{
                print(error.localizedDescription)
            }
   
        }
        
        
//MARK: - Load Data Functions
        static func loadData() {
            LoadSharedData()
            LoadNotifcation()
            LoadRoutine()
        }
        
        static func LoadSharedData(){
            if let data = try? Data(contentsOf: k.DataFilePath!) {
                let decoder = PropertyListDecoder()
                do {
                    let decoded = try decoder.decode(Datastructur.ArraysDataBundle.self, from: data)
                    Datastructur.sharedData = decoded
                } catch {print("Decoding error by data: \(error.localizedDescription)")}
            }
        }
        
        static func LoadNotifcation() {
            if let dataNoti = try? Data(contentsOf: k.DataFilePathNotification!) {
                let decoder = PropertyListDecoder()
                do {
                    let decoded = try decoder.decode([NotificationItem].self, from: dataNoti)
                    Datastructur.NotificationsArray = decoded
                } catch {print("Decoding error by dataNoti: \(error.localizedDescription)")}
            }
        }
        
        static func LoadRoutine(){
            if let dataRoutine = try? Data(contentsOf: k.DataFilePathRoutine!) {
                let decoder = PropertyListDecoder()
                do {
                    let decoded = try decoder.decode([String : RoutineItem].self, from: dataRoutine)
                    Datastructur.RoutineDict = decoded
                    //print("Loaded Routine")
                } catch {print("Decoding error by dataRoutine: \(error.localizedDescription)")}
            }
        }
        
        
        static func DayDate() -> String{
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "de_DE")
            formatter.timeZone = TimeZone(identifier: "Europe/Berlin")
            formatter.dateFormat = "EEEE"
            let dateString = formatter.string(from: Date())
            return dateString
        }
        
        static func ReflectTheTimeOnTraining(){
            let TodayDate = DayDate()
            let TodayIndex = Datastructur.DictDayToNum[TodayDate]
            if  TodayIndex == 0 {return}
            if let Dayes = sharedData?.Dayes{
                for i in 0...TodayIndex! - 1{
                    Dayes[i].IsLoser()
                }
            }
        }
        
        private static func UpdateDaysDict() {
            let TodayDate = DayDate()
            Defaults.set(true, forKey: TodayDate)
            
            if TodayDate == k.Tage.Montag {
                let Dayinmouth = GiveMeDayInMo()
                Defaults.set(String(Dayinmouth), forKey: k.LastOpenMontag)
            }
            
        }
        
        static func checkDayCollisoin() {
            let TodayDate = DayDate()
            if  IsTodaySonntag() {return}
            let TodayIndex = Datastructur.DictDayToNum[TodayDate]! + 1
            var DayesAfterAreSet = false
            for i in TodayIndex...6 {
                let Day = Datastructur.DictNumToDay[i]
                if Defaults.bool(forKey: Day!) {DayesAfterAreSet = true; break}
            }
            if DayesAfterAreSet || LastTimeOpenMontag() {DeleteAndResetAll();resetWeek(); }
            
        }
        private static func IsTodayMontag()->Bool{
            return DayDate() == k.Tage.Montag
        }
        
        private static func IsTodaySonntag()->Bool{
            return DayDate() == k.Tage.Sonntag
        }
        
        static func synchronizeTime() {
            UpdateDaysDict()
            checkDayCollisoin()
        }
        
        static func LastTimeOpenMontag()->Bool{
            if IsTodayMontag() && (String(GiveMeDayInMo()) != Defaults.string(forKey: k.LastOpenMontag)) {return true}
            return false
        }
        
        
        
        static func PlayVideoToday() -> String {
            let Day = GiveMeDayInMo()
            let videoName = Datastructur.videoMapping[Day] ?? "Video1"
            
            // Check if the video file actually exists in the bundle
            if Bundle.main.path(forResource: videoName, ofType: "mp4") != nil {
                return videoName
            } else {
                print("Video \(videoName) not found in bundle, falling back to Video1")
                return "Video1"
            }
        }
        
    }
    
}


//        static func AddGifToView(GifName gifName: String,View view: UIView) -> WKWebView {
//            let gifWebView = WKWebView()
//             gifWebView.isOpaque = false
//             gifWebView.backgroundColor = .clear
//             gifWebView.translatesAutoresizingMaskIntoConstraints = false
//             gifWebView.isUserInteractionEnabled = false
//            if let url = Bundle.main.url(forResource: gifName, withExtension: "gif")  {
//                 do {
//                     let data = try Data(contentsOf: url)
//                     gifWebView.load(data,
//                                     mimeType: "image/gif",
//                                     characterEncodingName: "UTF-8",
//                                     baseURL: url.deletingLastPathComponent())
//                 } catch {
//                     print("GIF load error: \(error.localizedDescription)")
//                 }
//             }
//
//            view.addSubview(gifWebView)
//            NSLayoutConstraint.activate([
//               gifWebView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//               gifWebView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
//               gifWebView.widthAnchor.constraint(equalToConstant: 350),
//               gifWebView.heightAnchor.constraint(equalToConstant: 350)])
//
//            return gifWebView
//        }
