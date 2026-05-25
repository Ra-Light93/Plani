//
//  TrackerAlertViewController.swift
//  Plani
//
//  Created by Raad Amar on 05.05.25

import UIKit

class TrackerAlertViewController: UIViewController {

    //View Component
    @IBOutlet weak var FrontBG: UIView!
    @IBOutlet weak var BehindBG: UIView!
    @IBOutlet weak var SearchingGuy: UIImageView!
    @IBOutlet weak var RoutineItemInfo: UIView!
    @IBOutlet weak var ExampleOfRoutineItem: UIView!
    @IBOutlet weak var TitleOfAlertRoutine: UILabel!
    
    //Routine Setting
    @IBOutlet weak var Stackview: UIView!
    @IBOutlet weak var TitleViewRoutine: UIView!
    @IBOutlet weak var GoalViewRoutine: UIView!
    @IBOutlet weak var ExtendedViewRoutine: UIView!
    
    //Action Elements
    @IBOutlet weak var RoutineNamePlaceHolder: UITextField!
    @IBOutlet weak var RoutineAmountPlaceHolder: UITextField!
    @IBOutlet weak var RoutineExtentionPlaceHolder: UITextField!
    
    //Example Elements
    @IBOutlet weak var ExampleRoutineLabel: UILabel!
    
    //deleget
    var TrackerViewDeleget: InformTrackerViewController?
    
    var Manager = MangerTAVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadAllUIComponent()
        AttachAllActionElements()
        Manager.deleget = self
    }
    
    func LoadAllUIComponent() {
        MakeBehindBGAlsDismiss()
        
        MakeFrontBGBoundRound()
        MakeFrontBGDunkel()
        MakeFrontBGLineBlack()

        ConfigureSearchGuyGif()
        
        ConfigureRoutineInfoView()
        ConfigureExampleRoutineView()

        
       
        AttachAllActionElements()
        MakeInLightAndBlackModeSameDesign()
    }
    
    func AttachAllActionElements() {
        RoutineNamePlaceHolder.delegate = self
        RoutineAmountPlaceHolder.delegate = self
        RoutineExtentionPlaceHolder.delegate = self
    }
    
    
 
    
}
