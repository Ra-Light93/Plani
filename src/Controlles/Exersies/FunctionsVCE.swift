//
//  FunctionsVCE.swift
//  Plani
//
//  Created by Raad Amar on 25.04.25.
//

import UIKit
extension ExercisesViewController {

//MARK: - Load All neccaries
    
    func InitAllElements(){
 
        // Make element translusent
        MakeElementTranclusent()
        
        // Set The Selected Day
        TheDay = Datastructur.sharedData!.Dayes[self.TheDayInt!]
        
        // Load Animation
        LoadAnimation()
        
        // Set Navigaion Name to Day Name
        TitleNavigationBar.title = TheDay?.name
        
        // Register Cell in Table and init the Table
        ExercisesTable.delegate = self
        ExercisesTable.dataSource = self
        ExercisesTable.register(UINib(nibName: k.Identifiers.ExerciseCell, bundle: nil), forCellReuseIdentifier: k.Nibs.ExerciseCell)
        
        // enable Swip Functionality
        EnableSwap()
        
    }
    
//MARK: -  Make Tranclucent elements
func MakeNavigationbarTranckucent() {
                NavigationBar.setBackgroundImage(UIImage(), for: .default)
                NavigationBar.shadowImage = UIImage()
                NavigationBar.isTranslucent = true
                NavigationBar.backgroundColor = .clear
            }
            
             func MakeTableTranckucent() {
                ExercisesTable.backgroundColor = .clear
                 ExercisesTable.separatorStyle = .none
            }
            
            func MakeElementTranclusent(){
                self.MakeNavigationbarTranckucent()
                self.MakeTableTranckucent()
            }
    
//MARK: - Exercis Logo In Circular Form
 func makeRundPic(for cell: UITableViewCell,with logo : String) {
        if let exerciseCell = cell as? ExerciseCell {
            exerciseCell.ExersiceImage.image = UIImage(named: logo)
            exerciseCell.ExersiceImage.layer.cornerRadius = exerciseCell.ExersiceImage.frame.width - 100 / 2
            exerciseCell.ExersiceImage.clipsToBounds = true
            exerciseCell.ExersiceImage.contentMode = .scaleAspectFill
        }
}
//MARK: - Swap functionality
    func EnableSwap(){
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipLeftToRight))
        swipeGesture.direction = .right
        view.addGestureRecognizer(swipeGesture)
    }
    
    @objc private func swipLeftToRight() {
        Backbutton(self)
    }
    
    
//MARK: -  Add Actions to Alert ToAddExercise
    func AddActionsForAddingExercise(_ alert: UIAlertController)->UIAlertController{
        var NoItemAdded = true
        let BaseM = TheDay?.isBaseMuskelFalse()
        let BauchM = TheDay?.isBauchMuskelFalse()
        Manger.checkemptybauch()
        
        if BaseM! && Manger.IsBrustNotAssignd(){
            alert.addAction(AddActionForAddingExercise(
                TrainingDayName: k.TraingDaysName.Brust,
                BaseMuskelbool : true,
                BauchMuskelbool : false,
                AddedExer: safeData!.Brust,
                Muskellog: k.Muskel.IMBrust
            ))
            NoItemAdded = false
        }
        
        if BaseM! && Manger.IsRückenNotAssignd() {
            alert.addAction(AddActionForAddingExercise(
                TrainingDayName: k.TraingDaysName.Rücken,
                BaseMuskelbool : true,
                BauchMuskelbool : false,
                AddedExer: safeData!.Rücken,
                Muskellog: k.Muskel.IMRückenback
            ))
            NoItemAdded = false
        }

        if BaseM! && Manger.IsSchulterNotAssignd(){
            alert.addAction(AddActionForAddingExercise(
                TrainingDayName: k.TraingDaysName.Schulter,
                BaseMuskelbool : true,
                BauchMuskelbool : false,
                AddedExer: safeData!.Schulter,
                Muskellog: k.Muskel.IMBack
            ))
            NoItemAdded = false
        }

        if BaseM! && Manger.IsTrisipsNotAssignd(){
            alert.addAction(AddActionForAddingExercise(
                TrainingDayName: k.TraingDaysName.Trisips,
                BaseMuskelbool : true,
                BauchMuskelbool : false,
                AddedExer: safeData!.Trisips,
                Muskellog: k.Muskel.IMTriceps
            ))
            NoItemAdded = false
        }

        if BaseM! && Manger.IsBeisipsNotAssignd(){
            alert.addAction(AddActionForAddingExercise(
                TrainingDayName: k.TraingDaysName.Beisips,
                BaseMuskelbool : true,
                BauchMuskelbool : false,
                AddedExer: safeData!.Beisips,
                Muskellog: k.Muskel.IMBiceps
            ))
            NoItemAdded = false
        }

        if BaseM! && Manger.IsBeineNotAssignd() {
            alert.addAction(AddActionForAddingExercise(
                TrainingDayName: k.TraingDaysName.Beine,
                BaseMuskelbool : true,
                BauchMuskelbool : false,
                AddedExer: safeData!.Beine,
                Muskellog: k.Muskel.IMBeine
            ))
            NoItemAdded = false
        }

        if BauchM! && Manger.IsBauchANotAssignd(){
            alert.addAction(AddActionForAddingExercise(
                TrainingDayName: k.TraingDaysName.BauchA,
                BaseMuskelbool : false,
                BauchMuskelbool : true,
                AddedExer: safeData!.BauchA,
                Muskellog: nil
            ))
            NoItemAdded = false
        }

        if BauchM! && Manger.IsBauchBNotAssignd()  {
            alert.addAction(AddActionForAddingExercise(
                TrainingDayName: k.TraingDaysName.BauchB,
                BaseMuskelbool : false,
                BauchMuskelbool : true,
                AddedExer: safeData!.BauchB,
                Muskellog: nil
            ))
            NoItemAdded = false
        }

        if BauchM! && Manger.IsBauchCNotAssignd() {
            alert.addAction(AddActionForAddingExercise(
                TrainingDayName: k.TraingDaysName.BauchC,
                BaseMuskelbool : false,
                BauchMuskelbool : true,
                AddedExer: safeData!.BauchC,
                Muskellog: nil
            ))
            NoItemAdded = false
        }

        if BaseM!{
            alert.addAction(AddActionForAddingExercise(
                TrainingDayName: k.TraingDaysName.Runing,
                BaseMuskelbool : true,
                BauchMuskelbool : true,
                AddedExer: safeData!.Runing,
                Muskellog: k.Muskel.IMRuning
            ))
            NoItemAdded = false
        }
        
        if NoItemAdded{
          return self.NoItemToAddAlert()
            
        }
        return alert
    }
    
    
//MARK: -  Add Actions to Alert To Remove Exercise
    func AddActionsForRemoveExercise(_ alert: UIAlertController){
        let BaseM = (TheDay?.isBaseMuskelTrue())!
        let BauchM = (TheDay?.isBauchMuskelTrue())!
        
        if BaseM {alert.addAction(AddActionForRemovingExersises(ExersiseName: self.TheDay!.BaseMukel!))}
        if BauchM {alert.addAction(AddActionForRemovingExersises(ExersiseName: self.TheDay!.BauchMuskel!))}
    }
    
//MARK: -  Add Action to alert of Adding Exercises
    func AddActionForAddingExercise(TrainingDayName traingDayname: String,
                   BaseMuskelbool baseMuskelbool: Bool,
                   BauchMuskelbool bauchMuskelbool: Bool,
                   AddedExer arr : [Exercise],
                   Muskellog logo : String?)->UIAlertAction{
                   let Action = UIAlertAction(title: traingDayname, style: .default) { action in
                            if baseMuskelbool{ if self.TheDay!.isBaseMuskelTrue() {print("no no"); return}}
                            if bauchMuskelbool{ if self.TheDay!.isBauchMuskelTrue() {print("no no"); return}}
                            self.TheDay!.AddThisElement(ElmentToAdd: arr)
                            if baseMuskelbool{ self.TheDay!.BaseMukel = traingDayname ; self.TheDay!.AssigndLogo = true;self.TheDay!.logo = logo}
                            if bauchMuskelbool{ self.TheDay!.BauchMuskel = traingDayname;}
                            Datastructur.Defaults.set(true, forKey: traingDayname)
                            self.ExercisesTable.reloadData()
                            self.LoadAnimation()
                            Datastructur.Functions.SaveSharedData()
                        }
                        return Action
    }
    
//MARK: -  Add Action to alert of Removing Exercises
    func AddActionForRemovingExersises(
        ExersiseName exersiseName : String
    )->UIAlertAction{
        let Action = UIAlertAction(title: exersiseName, style: .default) { action in
            self.TheDay!.removeTheseElement(AimdMuskel: exersiseName)
            if self.Manger.IsBaseMuskel(MuskelTypeName: exersiseName){
                self.TheDay!.BaseMukel = nil
                self.TheDay!.AssigndLogo = false;
                self.TheDay!.logo = nil
            }
            if self.Manger.IsBauchMuskel(MuskelTypeName: exersiseName){
                self.TheDay!.BauchMuskel = nil
            }
            Datastructur.Defaults.set(false, forKey: exersiseName)
            self.ExercisesTable.reloadData()
            self.LoadAnimation()
            Datastructur.Functions.SaveSharedData()
        }
        return Action
    }

    

    
//MARK: - Make alert

    func ConfigureAlertExercis(Title title : String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        // Background color with transparency
        if let bgView = alert.view.subviews.first?.subviews.first?.subviews.first {
            bgView.backgroundColor = UIColor.blue.withAlphaComponent(0.15)
        }
        
        // Add image at top center
        let imageSize: CGFloat = 80
        let image = UIImage.kirito1
        let imageView = UIImageView(
                                frame: CGRect(
                                            x: (alert.view.frame.minX) + imageSize,
                                            y: (alert.view.frame.minY) - imageSize * 1.635,
                                            width: imageSize + 50,
                                            height: imageSize + 50))
        imageView.image = image
        imageView.contentMode = .scaleAspectFill

        
        alert.view.addSubview(imageView)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        cancelAction.setValue(UIColor.white, forKey: "titleTextColor")
        alert.addAction(cancelAction)
        
        // Titel in Weiß
        let titleAttr = NSAttributedString(string: title, attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 17)
        ])
        alert.setValue(titleAttr, forKey: "attributedTitle")
        return alert
    }

//MARK: - No Item To Add Alert
    func NoItemToAddAlert()->UIAlertController {
        let Alert = UIAlertController(title: kExercise.NoItemToAddAlertTitle, message: kExercise.NoItemToAddAlertMessage, preferredStyle: .alert)
        let Action = UIAlertAction(title: "Cancel", style: .default)
        Action.setValue(UIColor.systemRed, forKey: "titleTextColor")
        Alert.addAction(Action)
        return Alert
        
    }
    
//MARK: - ConfigurCancegaylImage
func ConfigurCancelgaylImage(){
        self.AddAnimation(GifName: k.Gifs.CancelGuy, Image: CancelGuyAnimation,Speed: 0.09)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CancelGuyTapped))
        CancelGuyAnimation.addGestureRecognizer(tapGesture)
    }

//MARK: - Function for  CancelGuy is Tapped
    @objc func CancelGuyTapped() {
        let Alert = self.ConfigureAlertExercis(Title: kExercise.SelectExerciseNameToRemove)
        self.AddActionsForRemoveExercise(Alert)
        present(Alert, animated: false)
        
    }
    
//MARK: - See if behelet Need to be reload
    func shouldcancelguyload(){
        if (Manger.IsThereExercies()){
            if !CancelGuyAnimation.isAnimating {ConfigurCancelgaylImage()}
        }
        else {self.StopAnimation(UIImageview: CancelGuyAnimation)}
    }
        
    
//MARK: - ConfigurBehaletlImage
     func ConfigurBehaletlImage(){
        self.AddAnimation(GifName: k.Gifs.Bahelt, Image: BehaltAnimation,Speed: 0.2)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BehaletTapped))
        BehaltAnimation.addGestureRecognizer(tapGesture)
    }

//MARK: - Function for  Behalet is Tapped
    @objc func BehaletTapped() {
        self.SelectTheDaytraing(self)
    }
    
//MARK: - See if behelet Need to be reload
    func shouldBehalload(){
        if !(Manger.IsThereExercies()) {
            if !(BehaltAnimation.isAnimating){ ConfigurBehaletlImage()}
            else{return}
        }
        else {self.StopAnimation(UIImageview: BehaltAnimation)}
    }
    

//MARK: - Make Image Touchable & UnTouchable
    func MakeImageTouchAble(Image image : UIImageView){
        image.isUserInteractionEnabled = true}
    func MakeImageUntouchAble(Image image : UIImageView){
        image.isUserInteractionEnabled = false}
    

   
//MARK: - Load Animation
    func  LoadAnimation(){
        if !Manger.IsDayFinished(){
            shouldcancelguyload()
            shouldBehalload()
        }
        else {
            StopAnimation(UIImageview: CancelGuyAnimation)
        }
    }
    
//MARK: - remove Animation & make it untouchable
    func StopAnimation(UIImageview view : UIImageView) {
        self.MakeImageUntouchAble(Image: view)
        MakeAnimationDisapear(Image: view)
    }
    
//MARK: - Add an Animation to view
     func AddAnimation(GifName gifName : String,Image image : UIImageView, Speed speed : Double){
        guard let url = Bundle.main.url(forResource: gifName, withExtension: "gif"),
              let gifData = try? Data(contentsOf: url),
              let source = CGImageSourceCreateWithData(gifData as CFData, nil) else { return }
        
        var frames: [UIImage] = []
        let count = CGImageSourceGetCount(source)
        
        for i in 0..<count {
            let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil)
            let frame = UIImage(cgImage: cgImage!)
            
            frames.append(frame)
        }
        image.animationImages = frames
        image.animationDuration = Double(frames.count) * speed
        image.isHidden = false
        image.startAnimating()
        MakeAnimationApear(Image: image)
     }
    
//MARK: - Make Animation Apeare
    func MakeAnimationApear(Image image :UIImageView ){
        image.alpha = 0.0
        UIView.animate(withDuration: 0.8,
                       animations: {image.alpha = 1.0},
                       completion: {action in self.MakeImageTouchAble(Image: image)})
    }
    
//MARK: - Make Animation Disapare
    func MakeAnimationDisapear(Image image :UIImageView ){
        UIView.animate(withDuration: 0.5,
                       animations: { image.alpha = 0.0},
                       completion: { Action in
                        image.isHidden = true
                        image.alpha = 1.0
                        image.stopAnimating()
                        })
    }
    
//MARK: - passSelectedDay
    func passExercisOnExercisSettingcell(Exercis exercis : Exercise){
        ExercisSettingVcDelegt!.SetSelectedExercis(Exercis: exercis)
    }
//MARK: - prepare function of segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = segue.destination as! ExercisViewController
        ExercisSettingVcDelegt = sender.self
        passExercisOnExercisSettingcell(Exercis: Manger.PassSelectedExercis())
        sender.ExercisesViewDeleget = self
    }

    
}


