//
//  ViewController.swift
//  UIProgressView
//
//  Created by Sergey Lavrov on 03.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  //MARK: - Varible
  private var progressView = UIProgressView()
  private var button = UIButton()
  private var myTimer = Timer()
  
  //MARK: - Override
  override func viewDidLoad() {
    super.viewDidLoad()
    createProgress(progressView)
    createButton(button)
    button.addTarget(self, action: #selector(pushButton(button:)), for: .touchUpInside)
    createTimer()
  }
  
  //MARK: - Time
  private func createTimer(){
    myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
  }
  
  //MARK: - Selector
  @objc func updateProgressView(){
    if progressView.progress != 1.0 {
      progressView.progress += 0.1 / 1.0
    } else if progressView.progress == 1.0 {
      UIView.animate(withDuration: 0.7) {
        self.button.alpha = 1
        self.button.setTitle("Старт", for: .normal)
        self.myTimer.invalidate()
      }
    }
  }
  
  @objc func pushButton(button: UIButton){
    progressView.setProgress(0.0, animated: false)
    createTimer()
    button.setTitle("Загрузка...", for: .normal)
    button.alpha = 0.2
  }
  
  //MARK: - UI
  private func createProgress(_ progressView: UIProgressView){
    progressView.progressViewStyle = .bar
    progressView.frame = CGRect(x: view.center.x, y: view.center.y, width: 150, height: 50)
    progressView.setProgress(0.0, animated: false)
    progressView.progressTintColor = .orange
    progressView.trackTintColor = .gray
    progressView.center = view.center
    view.addSubview(progressView)
  }
  
  private func createButton(_ button: UIButton){
    button.frame = CGRect(x: view.center.x - 75,
                          y: view.center.y + 100,
                          width: 150, height: 50)
    button.setTitle("Загрузка...", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .orange
    button.alpha = 0.2
    view.addSubview(button)
  }
}
