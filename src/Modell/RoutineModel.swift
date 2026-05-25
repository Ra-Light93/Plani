//
//  RoutineModel.swift
//  Plani
//
//  Created by Raad Amar on 10.05.25.

import UIKit

class RoutineItem : Codable {
        private var _title: String = ""
        private var _extention: String = ""
        private var _amount: String = ""
        private var _imageData: Data?
        private var _finished: Bool = false
        private var _TodayAmountTaken : Int = 0
    
        var Title: String {
           get { return _title }
           set { _title = newValue }
        }

        var Extention: String {
           get { return _extention }
           set { _extention = newValue }
        }

        var Amount: String {
           get { return _amount }
           set { _amount = newValue }
        }

        var ImageData: Data? {
           get { return _imageData }
           set { _imageData = newValue }
        }

        var Finished: Bool {
           get { return _finished }
           set { _finished = newValue }
        }
    
    var TodayAmountTaken: Int {
       get { return _TodayAmountTaken }
        set { _TodayAmountTaken = newValue ;  checkIfFinished();}
    }

        func GiveMeIMage()->UIImage?{
                guard let data = ImageData else { return nil }
                return UIImage(data: data)
        }
    
    init(_title: String, _extention: String, _amount: String, _imageData: Data? = nil) {
        self._title = _title
        self._extention = _extention
        self._amount = _amount
        self._imageData = _imageData
    }
    
    func AmountInt() -> Int {
        if let amountFloat = Float(self.Amount) {
            let amountInt = Int(amountFloat)
            return amountInt
        } else {
            print("Invalid integer value:", self.Amount)
            return 0
        }
    }
    
    
    func checkIfFinished(){
        if _TodayAmountTaken >= AmountInt() {
            Finished = true
        }
        else {Finished = false}
    }
    
}

