//
//  FunctionsVCD.swift
//  Plani
//
//  Created by Raad Amar on 25.04.25.
//

import UIKit

extension DayViewController {
    
    //MARK: - Load All neccaries
    func LoadAllElements(){
        
        // Synchronize Time of Today
        Manger.synchronizeTheDate()
        
        //check for reloads
        Manger.Shouldinit()
        
        // MakeElementTanclusent
        Manger.MakeElementTranclusent()
        
        //Load all neccearys
        Manger.loadData()

        // reset func
        // Manger.RestAllData()
        // Manger.RestNotification()
        
        // show me untrained Day
        Manger.UnTrainedDayes()
        
        //Ask For Noti
        checkForPermission()
        
        // resgister TableView and its Cell and Load table
        DayesTableView.delegate = self
        DayesTableView.dataSource = self
        DayesTableView.register(UINib(nibName: k.Nibs.DayesCell, bundle: nil), forCellReuseIdentifier: k.Identifiers.DayesCell)
        DayesTableView.reloadData()
    
    }
    
}
