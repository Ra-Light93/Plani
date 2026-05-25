//
//  RoutineItemCell.swift
//  Plani
//
//  Created by Raad Amar on 10.05.25.
//

protocol InformTrackerViewFromCellPicker{
    func UpdatePickerIsSelected(NewValue new : Int, SelectedRowName Name : String)
}

import UIKit

class RoutineCell: UITableViewCell {
    
    var KeyInDict: String?
    var InformTracker : InformTrackerViewFromCellPicker?
    @IBOutlet weak var TextInhaltOfRoutine: UILabel!
    @IBOutlet weak var RoutineImage: UIImageView!
    @IBOutlet weak var RoutinePicker: UIPickerView!
    @IBOutlet weak var RoutineDoneIMage: UIImageView!
    var ArrayOfNumbers = [0]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        MakeBackGroundtranslusent()
        ConfigureCellWithTable()
        MakeRoutineImageRounded()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)}
    override func layoutSubviews() {
        super.layoutSubviews() }
    
    func MakeBackGroundtranslusent() {
        backgroundColor = .clear           // cell’s own background
        contentView.backgroundColor = .clear  // the contentView behind your outlets
        selectionStyle = .none
    }
    func ConfigureCellWithTable(){
        self.RoutinePicker.delegate = self
        self.RoutinePicker.dataSource = self
    }
    func MakeRoutineImageRounded() {
        RoutineImage.layer.cornerRadius = RoutineImage.frame.width / 4
        RoutineImage.clipsToBounds = true
        RoutineImage.backgroundColor = UIColor.black.withAlphaComponent(0.1)
    }
    
    
}


extension RoutineCell : UIPickerViewDelegate,UIPickerViewDataSource {
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
        guard let name = KeyInDict, !ArrayOfNumbers.isEmpty else { return }
        let selectedValue = ArrayOfNumbers[row]
        InformTracker?.UpdatePickerIsSelected(NewValue: selectedValue, SelectedRowName: name)
    }
}



