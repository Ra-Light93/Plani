//
//  ViewController.swift
//  Plani
//
//  Created by Raad Amar on 03.04.25.
//

import UIKit
import CoreData
import UserNotifications


class DayViewController: UIViewController {

    //UIButtons
    
    @IBOutlet weak var DayesTableView: UITableView!
    @IBOutlet weak var NavigationBar: UINavigationBar!

    //Global Variable in View
    var DayesArray = [Traning_Day]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let Manger = MangerVCD()
    
    override func viewDidLoad() {
       super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        Manger.deleget = self
        self.LoadAllElements()
    }
    
    @IBAction func ShowRoutineItemsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: k.segues.MainToTracker, sender: self)
    }
    
}

//MARK: - Show Tracker View


//MARK: -  TableView Extention
extension DayViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DayesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: k.Identifiers.DayesCell, for: indexPath) as! DayCellModels
        let TheDay = DayesArray[indexPath.row]
        cell.DayName.text = k.DictDayToDisplayName[TheDay.name] ?? TheDay.name // display the En Name - if not exist the DE one
        if TheDay.isAssigndLogoTrue()   {
            if TheDay.isLoser() {
                cell.DayImage.image = UIImage(named: k.ExraImages.Loser)
            }else {
                cell.DayImage.image = UIImage(named:TheDay.logo!)
            }
            cell.DayImage.isHidden = false
        }
        else {cell.DayImage.image = nil ;cell.DayImage.isHidden = true}
        
        cell.SetFinisedImgae(SetBool: TheDay.finished)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if DayesArray[indexPath.row].IsLoserAndNoRedAndExcuse() {
            RedAndExecuse(Row: indexPath.row)
        }
        else if DayesArray[indexPath.row].ShouldOpen() {
            if Manger.IsTody(Row: indexPath.row) {performSegue(withIdentifier: k.segues.FromDaysTOExercises, sender: self)}
            else {NotYourDay()}
        }
        else {
            RedoExercuseAndRed(Row: indexPath.row)
        }
    }
    
}


//MARK: -  Segue Extention
extension DayViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == k.segues.FromDaysTOExercises {
            let destinationVC = segue.destination as! ExercisesViewController
            if let indexPath = DayesTableView.indexPathForSelectedRow{
                destinationVC.TheDayInt = indexPath.row
                destinationVC.DayVCUpdater = self
            }
        }
        
        if segue.identifier == k.segues.MainToTracker {
            
        }
    }
}

//MARK: - extend The ViewControll deleget
extension DayViewController : UpdateViewController {
    func didDismissAndShouldReload() {
        DayesTableView.reloadData()
    }
}

//MARK: - Check Notificition
extension DayViewController{
    func checkForPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                Datastructur.dispatchWeeklyNotifications()
            
            case .denied:
                //print("Benachrichtigungen wurden abgelehnt.")
                return
            
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { didAllow, error in
                    if let error = error {
                        //print("Fehler bei der Anforderung der Erlaubnis: \(error.localizedDescription)")
                        return
                    }
                    if didAllow {
                        Datastructur.dispatchWeeklyNotifications()
                    } else {
                        //print("Benutzer hat keine Erlaubnis erteilt.")
                    }
                }
            
            default:
                //print("Unbekannter Benachrichtigungsstatus.")
                return
            }
        }
    }
}
