//
//  UIComponent.swift
//  Plani
//
//  Created by Raad Amar on 04.05.25.
//

import UIKit

extension TrackerViewController {
    
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
    
  
    func EnhanceTextStyle() {
            // 1) Grab your label by its IBOutlet
            let label = RoutineItemsText
            
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
        image.isUserInteractionEnabled = true
     }
    
    func ConfigurRoutinelImage(){
        AddAnimation(GifName: k.Gifs.Atome2, Image: RoutineItemsImage, Speed: 0.03)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RoutineImageTapped))
            RoutineItemsImage.addGestureRecognizer(tapGesture)
    }

    func MakeTableTranclucent(){
        RoutineTable.backgroundColor = .clear
        RoutineTable.separatorStyle = .none
    }
    
}
