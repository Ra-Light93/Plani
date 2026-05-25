//
//  TableViewCell.swift
//  Plani
//
//  Created by Raad Amar on 20.04.25.
//

import UIKit

class DayCellModels: UITableViewCell {

    @IBOutlet weak var DayName: UILabel!
    
    @IBOutlet weak var FinishedImage: UIImageView!
    @IBOutlet weak var DayImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.DayImage.isHidden = true
        print ()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func SetFinisedImgae(SetBool bool : Bool){
        FinishedImage.isHidden = !bool
        
    }
    
   
    
    
}
