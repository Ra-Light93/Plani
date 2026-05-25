//
//  ViewControllerExercises.swift
//  Plani
//
//  Created by Raad Amar on 21.04.25.
//

import UIKit
import WebKit


class ExercisesViewController: UIViewController {

    @IBOutlet weak var CancelGuyAnimation: UIImageView!
    @IBOutlet weak var BehaltAnimation: UIImageView!
    @IBOutlet weak var NavigationBar: UINavigationBar!
    @IBOutlet weak var DoneBackButton: UIBarButtonItem!
    @IBOutlet weak var ExercisesTable: UITableView!
    @IBOutlet weak var TitleNavigationBar: UINavigationItem!
    
    var TheDayInt : Int?
    var TheDay : Traning_Day?
    var safeData = Datastructur.sharedData
    var DayVCUpdater : UpdateViewController?
    var ExercisSettingVcDelegt : ExercisSettingDelegt?
    var Manger = MangerVCEs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Manger.deleget = self
        self.InitAllElements()
    }

    @IBAction func Backbutton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.DayVCUpdater?.didDismissAndShouldReload()
    }
    
    @IBAction func SelectTheDaytraing(_ sender: Any) {
        let Alert = self.ConfigureAlertExercis(Title: kExercise.SelectExerciseNameToAdd)
        let DoneAlert = self.AddActionsForAddingExercise(Alert)
        present(DoneAlert, animated: false)
    }

}

//MARK: -  Table Extention

extension ExercisesViewController: UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.TheDay!.Exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: k.Identifiers.ExerciseCell, for: indexPath) as! ExerciseCell
        let index = indexPath.row
        let Exercise = TheDay!.Exercises[index]
        Cell.ExersiceName.text = Exercise.name
        Cell.Repates.text = "\(Exercise.repates) x \(Exercise.amount)"
        self.makeRundPic(for: Cell,with: Exercise.logo)
        if (TheDay!.Exercises[index].finished) {Cell.MakeTextGreen()}
        else {Cell.MakeTextLightend()}
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedExer = TheDay?.Exercises[indexPath.row]
        else {
            print("Error while selecting exercise")
            return
        }
        Manger.SetSelectedExercis(Exercis: selectedExer)
        performSegue(withIdentifier: k.segues.DisplayExercisActivity, sender: self)
    }
    
    
}

//MARK: - Deleget of ViewControllerExersise
protocol UpdateViewController: AnyObject {
    func didDismissAndShouldReload()
}




