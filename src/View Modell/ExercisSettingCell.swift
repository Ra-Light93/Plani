//
//  ExercisSettingCell.swift
//  Plani
//
//  Created by Raad Amar on 27.04.25.
//
protocol ImformExercisVC{
    func PickerSelected(NewValue new : Int, SelectedRow Row : Int)
}


import UIKit

class ExercisSettingCell: UITableViewCell{
    
    var indexPath: Int?
    var InformExercis : ImformExercisVC?
    @IBOutlet weak var SetXName: UILabel!
    @IBOutlet weak var Picker: UIPickerView!
    @IBOutlet weak var AimToX: UILabel!
    @IBOutlet weak var ExercisIMageFinish: UIImageView!
    let ArrayOfNumbers = Array(0...100)
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear           // cell’s own background
        contentView.backgroundColor = .clear  // the contentView behind your outlets
        selectionStyle = .none
        
        Picker.dataSource = self
        Picker.delegate   = self
        Picker.tintColor = .white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

// MARK: - Swip Functions

extension ExercisSettingCell : UIPickerViewDataSource, UIPickerViewDelegate  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ArrayOfNumbers.count
    }

    
    func pickerView(_ picker: UIPickerView,
                    attributedTitleForRow row: Int,
                    forComponent comp: Int) -> NSAttributedString? {
      let text = "\(ArrayOfNumbers[row])"
      return NSAttributedString(
        string: text,
        attributes: [.foregroundColor: UIColor.white]
      )
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                InformExercis!.PickerSelected(NewValue: row, SelectedRow: indexPath!)
        }
    
    
    
}
