//
//  ViewController.swift
//  UIPicker
//
//  Created by Sergey Lavrov on 24.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let picker = UIPickerView()
    let dataTimePicker = UIDatePicker()
    let dataPicker = UIDatePicker()
    let timer = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создание пикера в центре экрана и подключение протоколов через экстеншны
        picker.center = view.center
        picker.dataSource = self
        picker.delegate = self
        view.addSubview(picker)
        
        // Создание дата пикера без ограничений
        dataTimePicker.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 150)
        dataTimePicker.addTarget(self, action: #selector(datePickerChange(param:)), for: .valueChanged)
        view.addSubview(dataTimePicker)

        // Создание дата пикера с ограничением по году
        dataPicker.frame = CGRect(x: 0, y: 150, width: view.frame.width, height: 150)
        dataPicker.datePickerMode = .date
        var oneYear = TimeInterval()
        oneYear = 365 * 24 * 60 * 60
        let todayDate = Date()
        let oneYearFromToday = todayDate.addingTimeInterval(oneYear)
        let twoYearFromToday = todayDate.addingTimeInterval(2 * oneYear)
        dataPicker.minimumDate = oneYearFromToday
        dataPicker.maximumDate = twoYearFromToday
        view.addSubview(dataPicker)
        dataPicker.addTarget(self, action: #selector(datePickerChange(param:)), for: .valueChanged)
 
        // Создание таймера
        timer.frame = CGRect(x: 0, y: view.frame.height-200, width: view.frame.width, height: 200)
        timer.datePickerMode = .countDownTimer
        timer.countDownDuration = 2 * 60
        view.addSubview(timer)
    }
    
    @objc func datePickerChange(param: UIDatePicker){
        if param.isEqual(dataTimePicker){
            print("date & time = ", param.date)
        }
        if param.isEqual(dataPicker){
            print("date = ", param.date)
        }
    }
}

extension ViewController: UIPickerViewDataSource{
    
    // Сколько компонентов выводить
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Сколько строк в компоненте
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "row = \(row)"
        return result
    }
}

