//
//  UIConfiguration.swift
//  Plani
//
//  Created by Raad Amar on 07.05.25.
//

import UIKit

extension TrackerAlertViewController{
    
    func MakeFrontBGBoundRound(){
        self.FrontBG.layer.cornerRadius = self.FrontBG.frame.height / 14
        self.FrontBG.clipsToBounds = true
    }

    func MakeBehindBGAlsDismiss(){
        let TapedFRec = UITapGestureRecognizer(target: self, action: #selector(MainBGTouched))
        BehindBG.addGestureRecognizer(TapedFRec)
    }
    
    @objc func MainBGTouched(){
        self.dismiss(animated: false)
    }
    
    func MakeFrontBGDunkel(){
        let Color = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
        FrontBG.backgroundColor = Color
    }
    
    func MakeFrontBGLineBlack(){
      //Make Shadow :
        FrontBG.layer.shadowColor = UIColor.black.cgColor
        FrontBG.layer.shadowOpacity = 0.30
        FrontBG.layer.shadowOffset = CGSize(width: 0, height: 1)
        FrontBG.layer.shadowRadius = 10
        FrontBG.layer.masksToBounds = false
        
      //Make Line Black :
        FrontBG.layer.borderColor = UIColor.black.cgColor
        FrontBG.layer.borderWidth = 0.20
    }
    
    
    func ConfigureSearchGuyGif() {
        AddAnimation(GifName: k.Gifs.SearchingGuy, Image: SearchingGuy, Speed: 0.03)
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(SreachGuyTaped) )
        SearchingGuy.isUserInteractionEnabled = true
        SearchingGuy.addGestureRecognizer(TapGesture)
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
     }
    
    

    
}

