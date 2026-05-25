//
//  MainAction.swift
//  Plani
//
//  Created by Raad Amar on 09.05.25.
//

import UIKit

extension TrackerAlertViewController : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        ShowInExample()}
    
    @objc func SreachGuyTaped() {
        let feedback = Manager.AddItmeToRoutineDict()
        ReflectInAlertView(Feedback : feedback)
    }
 
    func ReflectInAlertView(Feedback feedback : String){
        print(feedback)
        if feedback == k.ReturnStringsOfAlert.TextFailed {HandleTitleFailed()}
        if feedback == k.ReturnStringsOfAlert.AmountFailed {HandleAmountFailed()}
        if feedback == k.ReturnStringsOfAlert.ExtentionFailed {HandleExtentionFailed()}
        if feedback == k.ReturnStringsOfAlert.Done {
            HandleRoutineAddedDone();
            ResetRoutineComponent();
            TrackerViewDeleget?.UpdateTrackerViewController()}
    }

    
//MARK: - Handle Feedback from Alert
    func HandleTitleFailed() { GoFromRedToOriginalColor(UITextField: RoutineNamePlaceHolder)}
    func HandleAmountFailed() {GoFromRedToOriginalColor(UITextField: RoutineAmountPlaceHolder)}
    func HandleExtentionFailed() {GoFromRedToOriginalColor(UITextField: RoutineExtentionPlaceHolder)}
    func HandleRoutineAddedDone() {showSuccessBubble(on: self.view, message: "Successfully Added New Routine")}
    
    // func for animation red to Original Color
    func GoFromRedToOriginalColor(UITextField UItextF : UITextField ) {
        let OrignalColor = UItextF.backgroundColor
        UItextF.backgroundColor = UIColor(red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0)
        UIView.animate(withDuration: 0.8) {
            UItextF.backgroundColor = OrignalColor
        }
    }
    
    func showSuccessBubble(on view: UIView, message: String) {
        let bubble = UILabel()
        bubble.text = "✅ " + message
        bubble.textColor = .white
        bubble.backgroundColor = UIColor(red: 0.0, green: 0.75, blue: 0.45, alpha: 0.9) // minty green
        bubble.textAlignment = .center
        bubble.layer.cornerRadius = 12
        bubble.clipsToBounds = true
        bubble.alpha = 0
        bubble.font = .systemFont(ofSize: 14, weight: .semibold)

        // Set size and position
        let width: CGFloat = view.frame.width * 0.6
        bubble.frame = CGRect(x: (view.frame.width - width) / 2,
                              y: view.frame.height - 120,
                              width: width,
                              height: 40)

        view.addSubview(bubble)

        UIView.animate(withDuration: 0.3, animations: {
            bubble.alpha = 1
            bubble.frame.origin.y -= 20
        }) { _ in
            UIView.animate(withDuration: 0.3, delay: 1.2, options: [], animations: {
                bubble.alpha = 0
            }) { _ in
                bubble.removeFromSuperview()
            }
        }
    }
    
    func ResetRoutineComponent() {
        RoutineNamePlaceHolder.text = ""
        RoutineAmountPlaceHolder.text = ""
        RoutineExtentionPlaceHolder.text = ""
        ShowInExample()
    }
    
    
//MARK: - Funtion for linking Example with MainActions
    func ShowInExample(){
        let Name = RoutineNamePlaceHolder.text ?? ""
        let Amount = RoutineAmountPlaceHolder.text ?? ""
        let Extention = RoutineExtentionPlaceHolder.text ?? ""
        
        if Name.isEmpty &&  Amount.isEmpty && Extention.isEmpty{
            ExampleRoutineLabel.text = "E.g. Vitamin B3 1 Pil";
            ExampleRoutineLabel.textColor = UIColor.systemGray2
            return}
        let FullText = (Name + " " + Amount + " " + Extention)
        ExampleRoutineLabel.text = FullText
        ExampleRoutineLabel.textColor = UIColor.black
    }
    
    

    
}
