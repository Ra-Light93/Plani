//
//  UiConfiguration.swift
//  Plani
//
//  Created by Raad Amar on 26.04.25.
//
import UIKit

extension ExercisViewController {

    func MakePageSheetDisplayToHalf(){
        if let sheet = self.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
    }
    
    func MakePageSheetTranclusent(){
        let BlurEffect = UIBlurEffect(style: .light)
        let UiEffectView = UIVisualEffectView(effect: BlurEffect)
        view.backgroundColor = .clear
        UiEffectView.frame = view.bounds
        UiEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(UiEffectView, at: 0)
    }
    
    func MakePicRound(){
        ExercisImage.layer.cornerRadius = ExercisImage.frame.width - 135 / 2
        ExercisImage.clipsToBounds = true
        ExercisImage.contentMode = .scaleToFill
    }
    
    func EnhanceTextStyle() {
            // 1) Grab your label by its IBOutlet
            let label = ExercisName
            
            // 2) Transparent background so glow shows
            label!.backgroundColor = .clear
            
            // 3) Base text styling
            label!.textColor = .white
            
            // 4) Outer glow via layer shadow
        label!.layer.shadowColor = UIColor.black.cgColor
            label!.layer.shadowRadius = 10
            label!.layer.shadowOpacity = 0.8
            label!.layer.shadowOffset = .zero
            label!.layer.masksToBounds = false
            
            // 5) Inner glow via attributed‐string shadow
            let glow = NSShadow()
            glow.shadowColor = UIColor.black.withAlphaComponent(0.7)
            glow.shadowBlurRadius = 8
            glow.shadowOffset = .zero
            
            let attrs: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: label!.font as Any,
                .shadow: glow
            ]
            if let text = label!.text {
                label!.attributedText = NSAttributedString(string: text, attributes: attrs)
            }
        }
    
    func MakeTableTranclucent(){
        ExercisTableView.backgroundColor = .clear
        ExercisTableView.separatorStyle = .none
    }

    func SetNameandImageInTopView(){
        ExercisName.text = SelectedExercis?.name
        ExercisImage.image = UIImage(named: SelectedExercis?.name ?? "")
    }
    
    func ConifugureandUpdateLock() {
        if  Manger.CheckIfExersisFinished() {
            LockedE.isHidden = false
            if Manger.CheckifIsLocked() {
                LockedE.image = UIImage.locked
            }
            else {
                LockedE.image = UIImage.unlocked
            }
        }
        else {
            LockedE.isHidden = true
            LockedE.image = UIImage.unlocked
        }
    }
    
    
    //MARK: - Make Lock Image Interactable
    func MakeLockImageInteractable() {
        LockedE.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(lockTapped))
        LockedE.addGestureRecognizer(tap)
    }
    
    @objc private func lockTapped() {
        SelectedExercis?.Locked.toggle()
        self.ConifugureandUpdateLock()
        ExercisTableView.reloadData()
    }

}
