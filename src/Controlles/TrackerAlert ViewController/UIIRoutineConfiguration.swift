
import UIKit

extension TrackerAlertViewController{
    
    func ConfigureRoutineInfoView() {
        MakeRoutineInfoViewBoundRound()
        MakeShadowForRoutineItemInfo()
        MakeRoutineElementRound()
    }

    
    func MakeRoutineInfoViewBoundRound(){
        self.RoutineItemInfo.layer.cornerRadius = self.RoutineItemInfo.frame.height / 10
        self.RoutineItemInfo.clipsToBounds = true
    }
    
    func MakeShadowForRoutineItemInfo(){
      //Make Shadow :
        RoutineItemInfo.layer.shadowColor = UIColor.black.cgColor
        RoutineItemInfo.layer.shadowOpacity = 0.30
        RoutineItemInfo.layer.shadowOffset = CGSize(width: 0, height: 1)
        RoutineItemInfo.layer.shadowRadius = 5
        RoutineItemInfo.layer.masksToBounds = false
        
      //Make Line Black :
        RoutineItemInfo.layer.borderColor = UIColor.black.cgColor
        RoutineItemInfo.layer.borderWidth = 0.20
    }
    
    
    func ConfigureExampleRoutineView() {
        MakeExampleRoutineBoundRound()
        MakeShadowForExampleRoutine()
    }
    
    
    func MakeExampleRoutineBoundRound(){
        self.ExampleOfRoutineItem.layer.cornerRadius = self.RoutineItemInfo.frame.height / 16
        self.ExampleOfRoutineItem.clipsToBounds = true
    }
    
    func MakeShadowForExampleRoutine(){
      //Make Shadow :
        ExampleOfRoutineItem.layer.shadowColor = UIColor.black.cgColor
        ExampleOfRoutineItem.layer.shadowOpacity = 0.30
        ExampleOfRoutineItem.layer.shadowOffset = CGSize(width: 0, height: 1)
        ExampleOfRoutineItem.layer.shadowRadius = 5
        ExampleOfRoutineItem.layer.masksToBounds = false
        
      //Make Line Black :
        ExampleOfRoutineItem.layer.borderColor = UIColor.black.cgColor
        ExampleOfRoutineItem.layer.borderWidth = 0.20
    }
    
    
    func makeRound(View view : UIView,RoundValue value : Float){
        view.layer.cornerRadius = self.RoutineItemInfo.frame.height / CGFloat(value)
        view.clipsToBounds = true
    }
    
    func MakeRoutineElementRound() {
        makeRound(View: Stackview, RoundValue: 10)
        makeRound(View: TitleViewRoutine, RoundValue: 14)
        makeRound(View: GoalViewRoutine, RoundValue: 14)
        makeRound(View: ExtendedViewRoutine, RoundValue: 14)
    }
    
    func MakeInLightAndBlackModeSameDesign() {
        let fields = [RoutineNamePlaceHolder, RoutineAmountPlaceHolder, RoutineExtentionPlaceHolder]

        for field in fields {
             field?.backgroundColor = UIColor.white
                field?.attributedPlaceholder = NSAttributedString(
                    string: field?.placeholder ?? "",
                    attributes: [.foregroundColor: UIColor.lightGray]
                )
         }
        ExampleRoutineLabel.textColor = UIColor.lightGray
    }
}
