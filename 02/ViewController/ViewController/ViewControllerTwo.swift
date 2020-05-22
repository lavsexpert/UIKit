//
//  ViewControllerTwo.swift
//  ViewController
//
//  Created by Sergey Lavrov on 22.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {

    //MARK: - Override
    override func loadView(){
        super.loadView()
        print("loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        hello()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
    
    //MARK: - Functions
    func hello(){
        print("Hi")
    }
}
