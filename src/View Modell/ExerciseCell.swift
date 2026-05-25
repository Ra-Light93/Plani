//
//  ExerciseCell.swift
//  Plani
//
//  Created by Raad Amar on 22.04.25.
//

import UIKit

class ExerciseCell: UITableViewCell {

    @IBOutlet weak var Repates: UILabel!
    @IBOutlet weak var ExersiceImage: UIImageView!
    @IBOutlet weak var ExersiceName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.ExersiceImage.isHidden = false
        self.MakeTextLightend()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func MakeTextGreen() {
        
            let betterColor = UIColor(red: 0.07, green: 0.26, blue: 0.42, alpha: 1.00)

            // 1) Grab your label by its IBOutlet
            let label = ExersiceName
            
            // 2) Transparent background so glow shows
            label!.backgroundColor = .clear
            
            // 3) Outer glow via layer shadow
            label!.layer.shadowColor = UIColor.black.cgColor
            label!.layer.shadowRadius = 2
            label!.layer.shadowOpacity = 0.3
            label!.layer.shadowOffset = .zero
            label!.layer.masksToBounds = false
            
            // 4) Inner glow via attributed‐string shadow
            let glow = NSShadow()
            glow.shadowColor = UIColor.black.withAlphaComponent(0.3) // Weniger deckend
            glow.shadowBlurRadius = 2.5 // Weniger Verschwimmen
            glow.shadowOffset = CGSize(width: 0.5, height: 0.5) // Leichte Verschiebung
                
            let attrs: [NSAttributedString.Key: Any] = [
                .foregroundColor: betterColor,
                .font: label!.font as Any,
                .shadow: glow
            ]
            if let text = label!.text {
                label!.attributedText = NSAttributedString(string: text, attributes: attrs)
            }
        }
    
    func MakeTextLightend() {

            // 1) Grab your label by its IBOutlet
            let label = ExersiceName
            
            // 2) Transparent background so glow shows
            label!.backgroundColor = .clear
            
            // 3) Outer glow via layer shadow
            label!.layer.shadowColor = UIColor.black.cgColor
            label!.layer.shadowRadius = 2
            label!.layer.shadowOpacity = 0.3
            label!.layer.shadowOffset = .zero
            label!.layer.masksToBounds = false
            
            // 4) Inner glow via attributed‐string shadow
            let glow = NSShadow()
            glow.shadowColor = UIColor.black.withAlphaComponent(0.3) // Weniger deckend
            glow.shadowBlurRadius = 2.5 // Weniger Verschwimmen
            glow.shadowOffset = CGSize(width: 0.5, height: 0.5) // Leichte Verschiebung
                
            let attrs: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white ,
                .font: label!.font as Any,
                .shadow: glow
            ]
            if let text = label!.text {
                label!.attributedText = NSAttributedString(string: text, attributes: attrs)
            }
        }
    
    
}
