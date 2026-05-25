//
//  ExercisView.swift
//  Plani
//
//  Created by Raad Amar on 26.04.25.
//

import UIKit

class ExercisViewController : UIViewController {
   
    var SelectedExercis : Exercise? //ExercisSettingCell
    var ExercisesViewDeleget : UpdateFromExerSetting?
    
    @IBOutlet weak var LockedE: UIImageView!
    @IBOutlet weak var ExercisTableView: UITableView!
    @IBOutlet weak var ExercisName: UILabel!
    @IBOutlet weak var ExercisImage: UIImageView!
    
    let Manger = MangerVCE()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Manger.deleget = self
        LoadAllUIComponent()
        
        print("table width : \(self.ExercisTableView.frame.width)")
    }

    
    func LoadAllUIComponent(){
        MakePageSheetDisplayToHalf()
        MakePageSheetTranclusent()
        MakePicRound()
        EnhanceTextStyle()
        registertableAndCell()
        MakeTableTranclucent()
        SetNameandImageInTopView()
        MakeLockImageInteractable()
        
    }
    
}
