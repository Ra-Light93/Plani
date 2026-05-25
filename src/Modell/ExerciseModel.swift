//
//  Classes.swift
//  Plani
//
//  Created by Raad Amar on 03.04.25.
//


import UIKit

class Exercise : Codable{

    var name: String {
        get { return _name }
        set { _name = newValue }
    }
    private var _name: String

    var logo: String {
        get { return _logo }
        set { _logo = newValue }
    }
    private var _logo: String

    var amount: Int {
        get { return _amount }
        set { _amount = newValue }
    }
    private var _amount: Int
    
    var AmountOfcompletedReps: [Int: Int] {
        get {return _AmountOfcompletedReps}
    }
    private var _AmountOfcompletedReps: [Int: Int] = [:]

    var repates: Int {
        get { return _repates }
        set { _repates = newValue }
    }
    private var _repates: Int

    var finished: Bool {
        get { return _finished }
        set { _finished = newValue; }
    }
    private var _finished: Bool = false

    var order: Int {
        get { return _order }
        set { _order = newValue }
    }
    private var _order: Int
    
    var AmidMuskel : String{
        get {return _AmidMuskel}
        set {_AmidMuskel = newValue}
    }
    private var _AmidMuskel: String
    
    var Locked : Bool{
        get {return _Locked}
        set {_Locked = newValue}
    }
    private var _Locked: Bool = false
    
    internal init (name : String , repates : Int, amount : Int, order : Int,AmidMuskel : String){
        self._amount = amount
        self._name = name
        self._logo = name
        self._repates = repates
        self._order = order
        self._AmidMuskel = AmidMuskel
        self.setRepateDict()
    }

    private func setRepateDict(){
        for i in 0..._repates-1{self.setValueOfRips(SetNum: i, Value: 0)}
    }
    
    func IsThisSetDone(SetNum Num : Int)->Bool{
        return _AmountOfcompletedReps[Num]! >= _amount
    }
    
    private func UpdateFinishedProperty(){
        for elm in _AmountOfcompletedReps  {
            if elm.value < _amount {_finished = false; return}
        }
        _finished = true
    }

    
    func setValueOfRips(SetNum set : Int, Value value : Int){
        _AmountOfcompletedReps[set] = value
        UpdateFinishedProperty()
    }
    
    func Reset(){
        _Locked = false
        setRepateDict()
        _finished = false
    }
}
