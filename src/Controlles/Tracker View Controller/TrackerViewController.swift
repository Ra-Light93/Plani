//
//  TrackerViewController.swift
//  Plani
//
//  Created by Raad Amar on 04.05.25.
//
protocol InformTrackerViewController {
    func UpdateTrackerViewController()
}

import UIKit

class TrackerViewController: UIViewController {

    @IBOutlet weak var RoutineItemsImage: UIImageView!
    @IBOutlet weak var RoutineItemsText: UILabel!
    @IBOutlet weak var RoutineTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadAllUIComponent()
        print("Table width: \(self.RoutineTable.frame.width)")
    }

   
    

    func LoadAllUIComponent(){
        registertableAndCell()
        MakePageSheetDisplayToHalf()
        MakePageSheetTranclusent()
        EnhanceTextStyle()
        ConfigurRoutinelImage()
        MakeTableTranclucent()
        
        Manger.resetRoutinesForTodayIfSyncedy()
    }
}

extension TrackerViewController : InformTrackerViewController {
    func UpdateTrackerViewController() {
        RoutineTable.reloadData()
    }
}
